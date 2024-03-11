// To parse this JSON data, do
//
//     final ministriesResponse = ministriesResponseFromJson(jsonString);

import 'dart:convert';

MinistriesResponse ministriesResponseFromJson(String str) => MinistriesResponse.fromJson(json.decode(str));

String ministriesResponseToJson(MinistriesResponse data) => json.encode(data.toJson());

class MinistriesResponse {
  MinistriesResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory MinistriesResponse.fromJson(Map<String, dynamic> json) => MinistriesResponse(
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
    this.description,
    this.createdAt,
  });

  String? id;
  String? title;
  String? image;
  String? type;
  String? createdAt;
  String? description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    type: json["type"],
    description: json.containsKey("description") ? json["description"] : "",
    createdAt: json["created_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "type": type,
    "description": description,
    "created_at": createdAt,
  };
}
