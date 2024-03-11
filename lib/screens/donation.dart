import 'dart:convert';
import 'dart:io';

import 'package:churchapp_flutter/service/PaypalPayment.dart';
import 'package:churchapp_flutter/service/PaypalServices.dart';
import 'package:churchapp_flutter/service/payment-service.dart';
import 'package:churchapp_flutter/utils/ApiUrl.dart';
import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Donation extends StatefulWidget {
  @override
  _DonationState createState() => _DonationState();
}

class _DonationState extends State<Donation> {
  TextEditingController txtNameCtrl = new TextEditingController();
  TextEditingController txtEmailCtrl = new TextEditingController();
  TextEditingController txtDonationAmount = new TextEditingController();

  FocusNode txtFocusNode = new FocusNode();

  bool isLoading = false;
  String? stripe_status = '0';
  String? paypal_status = '0';

  payViaNewCard(BuildContext context) async {
    txtFocusNode.unfocus();

    var response = await StripeService.payWithNewCard(
        amount: txtDonationAmount.text,
        currency: 'USD',
        name: txtNameCtrl.text,
        email: txtEmailCtrl.text);
    if (response!.success == true) {
      success();
    }
  }

  Future<void> getStripeDetails() async {
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
            setState(() {
              stripe_status = res['result']['stripe_status'];
            });
          }
        }
        // List<Branches> _items = parseBranches(res);

      } else {}
    } catch (exception) {
      // I get no exception here
      print(exception);
    }
  }

  Future<void> getPaypalStatus() async {
    try {
      final dio = Dio();
      // Adding an interceptor to enable caching.
      print(ApiUrl.STRIPE_DETAILS);

      final response = await dio.get(
        ApiUrl.PAYPAL_DETAILS,
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
            setState(() {
              paypal_status = res['result']['paypal_status'];
            });
          }
        }
        // List<Branches> _items = parseBranches(res);

      } else {}
    } catch (exception) {
      // I get no exception here
      print(exception);
    }
  }

  Future<void> paywithApplePay(BuildContext context) async {
    setState(() {
      isLoading = true;
    });
    txtFocusNode.unfocus();
    StripeService.payViaApplePay(context, txtDonationAmount.text,
            name: txtNameCtrl.text, email: txtEmailCtrl.text)
        .then((StripeTransactionResponse? res) {
      print(res!.message);
      print(res.success);

      if (res.success == true) {
        success();
      }
    });
  }

  Future<void> success() async {
    txtNameCtrl.text = "";
    txtEmailCtrl.text = "";
    txtDonationAmount.text = "";
    setState(() {
      isLoading = false;
    });
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Donation to Bread of Life Ministries.',
              style: TextStyle(
                fontSize: 15,
              )),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'We sincerely thank you for your gracious donation to Bread of Life Ministries. It is highly appreciated. We thank you for your continued support. May you be blessed a hundred-fold',
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    StripeService.init();
    PaypalServices.init();
    getStripeDetails();
    getPaypalStatus();
    txtNameCtrl.text = "";
    txtEmailCtrl.text = "";
    txtDonationAmount.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Donation'),
      ),
      body: (isLoading)
          ? Center(
              child: CupertinoActivityIndicator(
              radius: 20,
            ))
          : Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      "Donation to Bread of Life Ministries",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextFormField(
                      controller: txtNameCtrl,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        labelText: 'Name',
                      )),
                  TextFormField(
                      controller: txtEmailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: 'Email',
                      )),
                  TextFormField(
                      onEditingComplete: () {
                        print("sss");
                      },
                      focusNode: txtFocusNode,
                      controller: txtDonationAmount,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'Donation Amount',
                      )),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (stripe_status == "1")
                        MaterialButton(
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('Pay via Card'),
                          onPressed: () {
                            if (validate() == true) {
                              payViaNewCard(context);
                            }
                          },
                        ),
                      if (Platform.isIOS)
                        MaterialButton(
                          color: Colors.blue[900],
                          textColor: Colors.white,
                          child: Text('Pay via Apple Pay'),
                          onPressed: () {
                            if (validate() == true) {
                              paywithApplePay(context);
                            }
                          },
                        ),
                      if (paypal_status == "1")
                        MaterialButton(
                          color: Colors.blueGrey[900],
                          textColor: Colors.white,
                          onPressed: () {
                            if (validate() == true) {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      PaypalPayment(
                                    amount: txtDonationAmount.text,
                                    email: txtEmailCtrl.text,
                                    name: txtNameCtrl.text,
                                    onFinish: (number) async {
                                      // payment done
                                      print('order id: ' + number);
                                      success();
                                    },
                                  ),
                                ),
                              );
                            }
                          },
                          child: Text(
                            'Pay with Paypal',
                            textAlign: TextAlign.center,
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }

  bool validate() {
    if (txtNameCtrl.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter Name",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG
      );
      return false;
    } else if (txtEmailCtrl.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your email",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG
      );
      return false;
    } else if (txtDonationAmount.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter donation amount",
          gravity: ToastGravity.BOTTOM,
          toastLength: Toast.LENGTH_LONG
      );
      return false;
    } else {
      return true;
    }
  }
}
