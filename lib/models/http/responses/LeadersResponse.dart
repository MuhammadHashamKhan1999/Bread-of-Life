// To parse this JSON data, do
//
//     final leadersResponse = leadersResponseFromJson(jsonString);

import 'dart:convert';

LeadersResponse leadersResponseFromJson(String str) => LeadersResponse.fromJson(json.decode(str));

String leadersResponseToJson(LeadersResponse data) => json.encode(data.toJson());

class LeadersResponse {
  LeadersResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory LeadersResponse.fromJson(Map<String, dynamic> json) => LeadersResponse(
    status: json["status"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };
}

class Result {
  Result({
    this.id,
    this.title,
    this.image,
    this.type,
    this.createdAt,
  });

  String? id;
  String? title;
  String? image;
  String? type;
  DateTime? createdAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "type": type,
    "created_at": createdAt!.toIso8601String(),
  };
}
