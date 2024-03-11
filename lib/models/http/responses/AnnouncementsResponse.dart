// To parse this JSON data, do
//
//     final announcementsResponse = announcementsResponseFromJson(jsonString);

import 'dart:convert';

AnnouncementsResponse announcementsResponseFromJson(String str) => AnnouncementsResponse.fromJson(json.decode(str));

String announcementsResponseToJson(AnnouncementsResponse data) => json.encode(data.toJson());

class AnnouncementsResponse {
  AnnouncementsResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory AnnouncementsResponse.fromJson(Map<String, dynamic> json) => AnnouncementsResponse(
    status: json["status"],
    result: List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "result": List<dynamic>.from(result!.map((x) => x.toJson())),
  };

  @override
  String toString() {
    return 'AnnouncementsResponse{status: $status, result: $result}';
  }
}

class Result {
  Result({
    this.id,
    this.title,
    this.text,
    this.sendAt,
  });

  String? id;
  String? title;
  String? text;
  String? sendAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    text: json["text"],
    sendAt: json["send_at"].toString(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "text": text,
    "send_at": sendAt,
  };

  @override
  String toString() {
    return 'Result{id: $id, title: $title, text: $text, sendAt: $sendAt}';
  }
}
