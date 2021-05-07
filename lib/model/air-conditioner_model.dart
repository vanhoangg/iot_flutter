import 'dart:convert';

Sensor sensorFromJson(String str) => Sensor.fromJson(json.decode(str));

String sensorToJson(Sensor data) => json.encode(data.toJson());

class Sensor {
  Sensor({
    this.user,
    this.isStart,
    this.temperature,
    this.humidity,
  });

  String user;
  bool isStart;
  int temperature;
  int humidity;

  factory Sensor.fromJson(Map<String, dynamic> json) => Sensor(
        user: json["user"],
        isStart: json["isStart"],
        temperature: json["temperature"],
        humidity: json["humidity"],
      );

  Map<String, dynamic> toJson() => {
        "user": user,
        "isStart": isStart,
        "temperature": temperature,
        "humidity": humidity,
      };
}
