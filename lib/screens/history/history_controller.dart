import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iot_flutter/model/history_model.dart';
import 'package:iot_flutter/repository/history.repo.dart';

class HistoryController extends GetxController {
  final HistoryReposiory historyReposiory = HistoryReposiory();
  var listHistory = Rx<List<History>>();
  getHistory() async {
    listHistory.value = (await historyReposiory.getHistory())
      ..sort((b, a) => a.id.compareTo(b.id));
    update();
  }

  setImageForSensor(String a) {
    switch (a) {
      case "fan":
        return "assets/images/quat.png";
      case "air-conditioner":
        return "assets/images/maylanh.png";
    }
  }
}
