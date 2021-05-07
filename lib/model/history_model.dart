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
    this.topic,
    this.user,
    this.isStart,
    this.date,
  });

  String id;
  String topic;
  String user;
  bool isStart;
  DateTime date;

  factory History.fromJson(Map<String, dynamic> json) => History(
        id: json["_id"],
        topic: json["topic"],
        user: json["user"],
        isStart: json["isStart"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "topic": topic,
        "user": user,
        "isStart": isStart,
        "date": date.toIso8601String(),
      };
}
