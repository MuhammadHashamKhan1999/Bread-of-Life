// To parse this JSON data, do
//
//     final documentsResponse = documentsResponseFromJson(jsonString);

import 'dart:convert';

DocumentsResponse documentsResponseFromJson(String str) => DocumentsResponse.fromJson(json.decode(str));

String documentsResponseToJson(DocumentsResponse data) => json.encode(data.toJson());

class DocumentsResponse {
  DocumentsResponse({
    this.status,
    this.result,
  });

  String? status;
  List<Result>? result;

  factory DocumentsResponse.fromJson(Map<String, dynamic> json) => DocumentsResponse(
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
    this.folderId,
    this.folderTitle,
    this.folderDescription,
    this.folderPath,
    this.foldersFileId,
    this.foldersFileTitle,
    this.foldersFileDescription,
    this.foldersFileCreatedAt,
    this.foldersFilePath,
  });

  String? folderId;
  String? folderTitle;
  String? folderDescription;
  String? folderPath;
  String? foldersFileId;
  String? foldersFileTitle;
  String? foldersFileDescription;
  DateTime? foldersFileCreatedAt;
  String? foldersFilePath;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    folderId: json["folder_id"],
    folderTitle: json["folder_title"],
    folderDescription: json["folder_description"],
    folderPath: json["folder_path"],
    foldersFileId: json["folders_file_id"],
    foldersFileTitle: json["folders_file_title"],
    foldersFileDescription: json["folders_file_description"],
    foldersFileCreatedAt: DateTime.parse(json["folders_file_created_at"]),
    foldersFilePath: json["folders_file_path"],
  );

  Map<String, dynamic> toJson() => {
    "folder_id": folderId,
    "folder_title": folderTitle,
    "folder_description": folderDescription,
    "folder_path": folderPath,
    "folders_file_id": foldersFileId,
    "folders_file_title": foldersFileTitle,
    "folders_file_description": foldersFileDescription,
    "folders_file_created_at": foldersFileCreatedAt!.toIso8601String(),
    "folders_file_path": foldersFilePath,
  };
}
