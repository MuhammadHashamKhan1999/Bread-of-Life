// To parse this JSON data, do
//
//     final documentFoldersResponse = documentFoldersResponseFromJson(jsonString);

import 'dart:convert';

DocumentFoldersResponse documentFoldersResponseFromJson(String str) => DocumentFoldersResponse.fromJson(json.decode(str));

String documentFoldersResponseToJson(DocumentFoldersResponse data) => json.encode(data.toJson());

class DocumentFoldersResponse {
  DocumentFoldersResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory DocumentFoldersResponse.fromJson(Map<String, dynamic> json) => DocumentFoldersResponse(
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
    this.path,
    this.description,
    this.createdAt,
  });

  String? id;
  String? title;
  String? path;
  String? description;
  DateTime? createdAt;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    id: json["id"],
    title: json["title"],
    path: json["path"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "path": path,
    "description": description,
    "created_at": createdAt!.toIso8601String(),
  };
}
