// To parse this JSON data, do
//
//     final prayerRequestResponse = prayerRequestResponseFromJson(jsonString);

import 'dart:convert';

PrayerRequestResponse prayerRequestResponseFromJson(String str) => PrayerRequestResponse.fromJson(json.decode(str));

String prayerRequestResponseToJson(PrayerRequestResponse data) => json.encode(data.toJson());

class PrayerRequestResponse {
  PrayerRequestResponse({
    this.status,
    this.result,
  });

  String? status;
  Result? result;

  factory PrayerRequestResponse.fromJson(Map<String, dynamic> json) => PrayerRequestResponse(
    status: json["status"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": result!.toJson(),
  };
}

class Result {
  Result({
    this.prayForYou,
    this.followUp,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
  });

  String? prayForYou;
  String? followUp;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    prayForYou: json["pray_for_you"],
    followUp: json["follow_up"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    email: json["email"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "pray_for_you": prayForYou,
    "follow_up": followUp,
    "firstname": firstname,
    "lastname": lastname,
    "email": email,
    "phone": phone,
  };
}
