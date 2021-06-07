import 'dart:convert';

import '../constants.dart';

SubSensorModel subSensorFromJson(String str) =>
    SubSensorModel.fromJson(json.decode(str));

String subSensorJson(SubSensorModel data) => json.encode(data.toJson());

class SubSensorModel {
  SubSensorModel(
      {this.sensorName,
      this.sensorType,
      this.value,
      this.user,
      this.isStart,
      this.img});
  String user;
  bool isStart;
  String sensorName;
  int sensorType;
  int value;
  String img;

  factory SubSensorModel.fromJson(Map<String, dynamic> json) => SubSensorModel(
      sensorName: json["sensorName"] == null ? null : json['sensorName'],
      sensorType: json["sensorType"] == null
          ? null
          : appConvertIntJson(json['sensorType']),
      value: json["value"] == null ? null : json['value'],
      user: json["user"] == null ? null : json['user'],
      isStart: json["isStart"] == null ? null : json['isStart']);

  Map<String, dynamic> toJson() => {
        "sensorName": sensorName,
        "sensorType": sensorType,
        "value": value,
        "user": user,
        "isStart": isStart
      };
}
