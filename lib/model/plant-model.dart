import 'dart:convert';

List<Plant> plantFromJson(String str) =>
    List<Plant>.from(json.decode(str).map((x) => Plant.fromJson(x)));

String plantToJson(List<Plant> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plant {
  Plant({
    this.id,
    this.uid,
    this.title,
    this.temperature,
    this.humidity,
    this.water,
    this.description,
    this.fileName,
    this.filePath,
    this.fileType,
    this.fileSize,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String uid;
  String title;
  int temperature;
  int humidity;
  int water;
  String description;
  String fileName;
  String filePath;
  String fileType;
  String fileSize;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Plant.fromJson(Map<String, dynamic> json) => Plant(
        id: json["_id"],
        uid: json["uid"],
        title: json["title"],
        temperature: json["temperature"],
        humidity: json["humidity"],
        water: json["water"],
        description: json["description"],
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
        "uid": uid,
        "title": title,
        "temperature": temperature,
        "humidity": humidity,
        "water": water,
        "description": description,
        "fileName": fileName,
        "filePath": filePath,
        "fileType": fileType,
        "fileSize": fileSize,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
