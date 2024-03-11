// To parse this JSON data, do
//
//     final albumImagesResponse = albumImagesResponseFromJson(jsonString);

import 'dart:convert';

AlbumImagesResponse albumImagesResponseFromJson(String str) => AlbumImagesResponse.fromJson(json.decode(str));

String albumImagesResponseToJson(AlbumImagesResponse data) => json.encode(data.toJson());

class AlbumImagesResponse {
  AlbumImagesResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory AlbumImagesResponse.fromJson(Map<String, dynamic> json) => AlbumImagesResponse(
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
    this.albumId,
    this.image,
  });

  String? id;
  String? albumId;
  String? image;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    albumId: json["album_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "album_id": albumId,
    "image": image,
  };
}
