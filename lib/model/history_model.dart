// To parse this JSON data, do
//
//     final History = HistoryFromJson(jsonString);

import 'dart:convert';

List<History> historyFromJson(String str) =>
    List<History>.from(json.decode(str).map((x) => History.fromJson(x)));

String historyToJson(List<History> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class History {
  History({
    this.id,
    this.sensorName,
    this.user,
    this.isStart,
    this.date,
    this.sensorType,
  });

  String? id;
  String? sensorName;
  int? sensorType;
  String? user;
  bool? isStart;
  DateTime? date;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        sensorName: json["sensorName"],
        sensorType: json["sensorType"],
        user: json["user"],
        isStart: json["isStart"] ?? false,
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "sensorName": sensorName,
        "sensorType": sensorType,
        "user": user,
        "isStart": isStart,
        "date": date?.toIso8601String(),
      };
}
