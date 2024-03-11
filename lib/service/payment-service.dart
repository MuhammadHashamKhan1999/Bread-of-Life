import 'dart:async';
import 'dart:convert';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'package:fluttertoast/fluttertoast.dart';

class StripeTransactionResponse {
  String? message;
  bool? success;

  StripeTransactionResponse({this.message, this.success});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentApiUrl = '${StripeService.apiBase}/payment_intents';

  static Map<String, String>? headers;

  static String? stripe_sk = "";
  static String? stripe_pk = "";
  static String androidPayMode = "";
  static String? payment_id = "";
  static String? customer_id = "";

  static Future<void> getStripeDetails() async {
    try {
      final dio = Dio();
      // Adding an interceptor to enable caching.
      print(ApiUrl.STRIPE_DETAILS);

      final response = await dio.get(
        ApiUrl.STRIPE_DETAILS,
        options: buildCacheOptions(
          Duration(minutes: 0),
          maxStale: Duration(minutes: 0),
          options: (Options(contentType: 'application/json')),
        ),
      );

      if (response.statusCode == 200) {
        dynamic res = jsonDecode(response.data);
        print(res);
        if (res['status'] == 'ok') {
          if (res['result'] != null) {
            //stripe_sk = res['result']['stripe_sk'];
            stripe_sk = "sk_test_tR3PYbcVNZZ796tH88S4VQ2u";
            // stripe_pk = res['result']['stripe_pk'];
            stripe_pk =
                "pk_test_51BTUDGJAJfZb9HEBwDg86TN1KNprHjkfipXmEDMb0gSCassK5T3ZfxsAbcgKVmAIXF7oZ6ItlZZbXO6idTHE67IM007EwQ4uN3";

            androidPayMode =
                res['result']['sandbox'] == 'live' ? 'production' : 'test';
          }
        }
      } else {}
    } catch (exception) {
      // I get no exception here
      print(exception);
    }
  }

  static init() async {
    await getStripeDetails();

    /*StripePayment.setOptions(StripeOptions(
        publishableKey: stripe_pk,
        merchantId: "merchant.com.BreadofLifeMinistries",
        androidPayMode: androidPayMode));*/
    Stripe.publishableKey = stripe_pk!;
    Stripe.merchantIdentifier = "merchant.com.BreadofLifeMinistries";
  }

  static Future<String?> createcustomer(
      {String? name, String? email, PaymentMethod? method}) async {
    try {
      var data = {'name': name, 'email': email, 'payment_method': method};
      headers = {
        'Authorization': 'Bearer ${StripeService.stripe_sk}',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      Response response = await Dio().post(
        'https://api.stripe.com/v1/customers',
        data: data,
        options:
            Options(contentType: Headers.formUrlEncodedContentType, headers: {
          'Authorization': 'Bearer ${StripeService.stripe_sk}',
        }),
      );
      customer_id = response.data['id'];
      return customer_id;
      //print('response: ${jsonDecode(response.data)}');
      //return jsonDecode(response.data);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }

  static Future saveDonatioNew({
    String? name,
    String? email,
    String? method,
    String? amount,
    String? reason,
    String? reference,
  }) async {
    try {
      var data = {
        'name': name,
        'email': email,
        'reason': reason,
        'amount': amount,
        'method': method,
        'reference': reference
      };

      Response response = await Dio()
          .post('https://bolm.churchapp.io/api/saveDonationNew', data: data);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  static Future<StripeTransactionResponse?> payWithNewCard(
      {required String amount,
      String? currency,
      String? name,
      String? email}) async {
    try {
      /* var paymentMethod = await Stripe.instance.createPaymentMethod(PaymentMethodParams.card(paymentMethodData: PaymentMethodData()));
      String? cresponse = await StripeService.createcustomer(
          name: name, email: email,method: paymentMethod );*/

      int convertedAmount = int.parse(amount);
      convertedAmount = convertedAmount * 100;

      var paymentIntent = await (StripeService.createPaymentIntent(
          convertedAmount.toString(), currency));
      /* var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));*/
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: paymentIntent!['client_secret'],
              style: ThemeMode.dark,
              merchantDisplayName: 'BreadofLifeMinistries'));
      try {
        await Stripe.instance.presentPaymentSheet(parameters: PresentPaymentSheetParameters(
          clientSecret: stripe_sk!,
          confirmPayment: true,))
            .then((newValue) async {
          String? saveDonationResponse = await StripeService.saveDonatioNew(
            name: name,
            email: email,
            reason: 'Donation',
            amount: convertedAmount.toString(),
            method: 'Stripe Card Payment',
          );
          return new StripeTransactionResponse(
              message: 'Transaction successful', success: true);
        }).onError((error, stackTrace) {
          return new StripeTransactionResponse(
              message: 'Transaction failed', success: false);
        });
      } on StripeException catch (e) {
        return new StripeTransactionResponse(
            message: 'Transaction failed: ${e.toString()}', success: false);
      } catch (e) {
        return new StripeTransactionResponse(
            message: 'Transaction failed: ${e.toString()}', success: false);
      }
      /*if (response.status == 'succeeded') {
        String? saveDonationResponse = await StripeService.saveDonatioNew(
          name: name,
          email: email,
          reason: 'Donation',
          amount: convertedAmount.toString(),
          method: 'Stripe Card Payment',
        );
        return new StripeTransactionResponse(
            message: 'Transaction successful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}', success: false);
    }*/
    } catch (e) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${e.toString()}', success: false);
    }
  }

  static getPlatformExceptionErrorResult(err) {
    String message = 'Something went wrong';
    if (err.code == 'cancelled') {
      message = 'Transaction cancelled';
    }

    return new StripeTransactionResponse(message: message, success: false);
  }

  static Future<Map<String, dynamic>?> createPaymentIntent(
      String amount, String? currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      headers = {
        'Authorization': 'Bearer ${StripeService.stripe_sk}',
        'Content-Type': 'application/x-www-form-urlencoded'
      };

      Response response = await Dio().post(StripeService.paymentApiUrl,
          data: body,
          options: Options(
              headers: StripeService.headers,
              contentType: Headers.formUrlEncodedContentType));
      print(response);
      print(response.headers);

      return response.data;
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }

  static Future<StripeTransactionResponse?> payViaApplePay(
      BuildContext context, String amount,
      {String? email, String? name}) async {
    // return token;

    try {
      if (Stripe.instance.isApplePaySupported == false) {
        Fluttertoast.showToast(msg: "Apple Pay Not Supported By Device");
      }
      ApplePayPresentParams params = ApplePayPresentParams(cartItems: [
        ApplePayCartSummaryItem.immediate(label: "Donation", amount: amount)
      ], country: "USA", currency: "USD");
      var response = await Stripe.instance.presentApplePay(params);
      await Stripe.instance.confirmApplePayPayment(stripe_sk!);

      /* var token = await StripePayment.paymentRequestWithNativePay(
        androidPayOptions: AndroidPayPaymentRequest(
          totalPrice: amount.toString(),
          currencyCode: "USD",
        ),
        applePayOptions: ApplePayPaymentOptions(
          countryCode: 'US',
          currencyCode: 'USD',
          items: [
            ApplePayItem(
              label: 'Donation to Bread of Life Ministries',
              amount: amount.toString(),
            )
          ],
        ),
      );*/

      /*print(token.tokenId);

      var paymentMethod =
          await StripePayment.createPaymentMethod(PaymentMethodRequest(
        card: CreditCard(
          token: token.tokenId,
        ),
      ));*/

      /* payment_id = paymentMethod.id;

      String? cresponse = await StripeService.createcustomer(
          name: name, email: email, method: paymentMethod.id);*/

      /*  int convertedAmount = int.parse(amount);
      convertedAmount = convertedAmount * 100;

      var paymentIntent = await (StripeService.createPaymentIntent(
          convertedAmount.toString(), "USD", customer_id) as FutureOr<Map<String, dynamic>>);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethod.id));

      print(response);*/
/*
      if (response.status == 'succeeded') {
        String? saveDonationResponse = await StripeService.saveDonatioNew(
          name: name,
          email: email,
          reason: 'Donation',
          amount: convertedAmount.toString(),
          method: 'Apple Pay Payment',
          reference: paymentMethod.id,
        );
        print("succeed");
        StripePayment.completeNativePayRequest();

        return new StripeTransactionResponse(
            message: 'Transaction successful', success: true);
      } else {
        StripePayment.completeNativePayRequest();

        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }*/

      // return new StripeTransactionResponse(message: 'Transaction failed:', success: false);
    } on PlatformException catch (err) {
      return StripeService.getPlatformExceptionErrorResult(err);
    } catch (err) {
      //StripePayment.completeNativePayRequest();
      return new StripeTransactionResponse(message: 'Transaction failed: ${err.toString()}', success: false);
    }
  }
}
