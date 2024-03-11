// To parse this JSON data, do
//
//     final galleryAlbumsResponse = galleryAlbumsResponseFromJson(jsonString);

import 'dart:convert';

GalleryAlbumsResponse galleryAlbumsResponseFromJson(String str) => GalleryAlbumsResponse.fromJson(json.decode(str));

String galleryAlbumsResponseToJson(GalleryAlbumsResponse data) => json.encode(data.toJson());

class GalleryAlbumsResponse {
  GalleryAlbumsResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory GalleryAlbumsResponse.fromJson(Map<String, dynamic> json) => GalleryAlbumsResponse(
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
    this.featured,
    this.title,
    this.description,
  });

  String? id;
  String? featured;
  String? title;
  String? description;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    featured: json["featured"],
    title: json["title"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "featured": featured,
    "title": title,
    "description": description,
  };
}
