// To parse this JSON data, do
//
//     final eventsResponse = eventsResponseFromJson(jsonString);

import 'dart:convert';

EventsResponse eventsResponseFromJson(String str) => EventsResponse.fromJson(json.decode(str));

String eventsResponseToJson(EventsResponse data) => json.encode(data.toJson());

class EventsResponse {
  EventsResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory EventsResponse.fromJson(Map<String, dynamic> json) => EventsResponse(
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
    this.details,
    this.thumbnail,
    this.time,
    this.date,
  });

  String? id;
  String? title;
  String? details;
  String? thumbnail;
  String? time;
  String? date;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    details: json["details"],
    thumbnail: json["thumbnail"],
    time: json["time"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "details": details,
    "thumbnail": thumbnail,
    "time": time,
    "date": "date",
  };
}