class AirConditionerModel{
  final String name;
  final bool isStart;

  AirConditionerModel(this.name, this.isStart);

  AirConditionerModel.fromJsonMap(Map<String, dynamic> map)
      : name = map["name"],
        isStart = map["isStart"];
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = name;
    data['isStart'] = isStart;
    return data;
  }
}
