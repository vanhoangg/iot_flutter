import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iot_flutter/model/chart_history_model.dart';
import 'package:iot_flutter/model/history_model.dart';
import 'package:darq/darq.dart';
import 'package:iot_flutter/repository/history.repo.dart';

class HistoryController extends GetxController {
  final HistoryReposiory historyReposiory = HistoryReposiory();
  var listHistory = Rx<List<History>>();
  var listChartData = List<ChartHistorySenSor>().obs;
  int count = 0;

  @override
  void onInit() async {
    await getHistory();
    await getChartDate();
    setCount();
    super.onInit();
  }

  getHistory() async {
    listHistory.value = (await historyReposiory.getHistory())
      ..sort((b, a) => a.id.compareTo(b.id));
    update();
  }

  getChartDate() {
    var listTopic = listHistory.value.distinct((e) => e.topic).toList();
    listTopic.forEach((e) {
      listChartData.add(ChartHistorySenSor(topic: e.topic, color: Colors.blue));
    });
  }

  setCount() {
    listHistory.value.forEach((elm) {
      listChartData.forEach((element) {
        if (elm.topic == element.topic && elm.isStart) element.countEnable += 1;
      });
    });
  }

  setImageForSensor(String a) {
    switch (a) {
      case "fan":
        return "assets/images/quat.png";
      case "air-conditioner":
        return "assets/images/maylanh.png";
      case "incandescent-bulbs":
        return "assets/icons/temp.jpg";
      default:
        return "assets/icons/temp.jpg";
    }
  }
}
