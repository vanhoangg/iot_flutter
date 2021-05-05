// class InfoIot {
//   // String id;
//   // String title;
//   // String content;
//   // String filePath;
//   // InfoIot({this.id, this.title, this.content, this.filePath});
//   // InfoIot.fromJsonMap(Map<String, dynamic> map)
//   //     : id = map["id"],
//   //       title = map["title"],
//   //       content = map["content"],
//   //       filePath = map["filePath"];
//   //
// }
// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<InfoIot> infoIotFromJson(String str) =>
    List<InfoIot>.from(json.decode(str).map((x) => InfoIot.fromJson(x)));

String infoIotToJson(List<InfoIot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class InfoIot {
  InfoIot({
    this.id,
    this.title,
    this.content,
    this.fileName,
    this.filePath,
    this.fileType,
    this.fileSize,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String title;
  String content;
  String fileName;
  String filePath;
  String fileType;
  String fileSize;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory InfoIot.fromJson(Map<String, dynamic> json) => InfoIot(
        id: json["_id"],
        title: json["title"],
        content: json["content"],
        fileName: json["fileName"],
        filePath: json["filePath"],
        fileType: json["fileType"],
        fileSize: json["fileSize"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "content": content,
        "fileName": fileName,
        "filePath": filePath,
        "fileType": fileType,
        "fileSize": fileSize,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
