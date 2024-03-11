// To parse this JSON data, do
//
//     final moreResponse = moreResponseFromJson(jsonString);

import 'dart:convert';

MoreResponse moreResponseFromJson(String str) => MoreResponse.fromJson(json.decode(str));

String moreResponseToJson(MoreResponse data) => json.encode(data.toJson());

class MoreResponse {
  MoreResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory MoreResponse.fromJson(Map<String, dynamic> json) => MoreResponse(
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
    this.heading,
    this.title,
    this.description,
    this.image,
    this.createdAt,
  });

  String? id;
  String? heading;
  String? title;
  String? description;
  String? image;
  String? createdAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    heading: json["heading"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "heading": heading,
    "title": title,
    "description": description,
    "image": image,
    "created_at": createdAt,
  };
}