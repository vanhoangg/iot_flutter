class SensorModel {
  String name;
  bool isStart;

  SensorModel({this.name, this.isStart});

  SensorModel.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        isStart = map["isStart"];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['isStart'] = isStart;
    return data;
  }
}
