// import 'package:darq/darq.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';

// import '../../model/chart_history_model.dart';
// import '../../model/history_model.dart';
// import '../../repository/history.repo.dart';
// import '../authen/controller/auth_controller.dart';
// import '../iot_dashboard/dashboard_controller.dart';

// class HistoryController extends GetxController {
//   final HistoryReposiory historyReposiory = HistoryReposiory();
//   var listHistory = Rx<List<History>>();
//   var listTopic = Rx<List<History>>();
//   var listChartData = List<ChartHistorySenSor>().obs;

//   int count = 0;
//   final DashBoardController controller = Get.find();
//   final AuthController authController = Get.find();
//   @override
//   void onInit() async {
//     await getHistory();
//     super.onInit();
//   }

//   getHistory() async {
//     listHistory.value = (await historyReposiory.getHistory(
//         token: authController.userProfile.value.token))
//       ..sort((b, a) => a.id.compareTo(b.id));
//     getChartDate();
//     update();
//   }

//   updateHistory() async {
//     if (controller.subSensor.value.sensorType == 1) {
//       var sensor = controller.subSensor.value;
//       var historyUpdate = listTopic.value.firstWhere(
//           (e) => e.sensorName == sensor.sensorName,
//           orElse: () => null);

//       if (historyUpdate != null) {
//         historyUpdate.isStart = sensor.isStart;
//         historyUpdate.sensorType = sensor.sensorType;
//         historyUpdate.user = sensor.user;
//         historyUpdate.sensorName = sensor.sensorName;
//       } else
//         listTopic.value.add(History(
//             sensorName: sensor.sensorName,
//             user: sensor.user,
//             isStart: sensor.isStart,
//             sensorType: sensor.sensorType));

//       // listTopic.value.forEach((e) {
//       //   if (e.sensorName == sensor.sensorName) {
//       //     e.isStart = sensor.isStart;
//       //     e.sensorType = sensor.sensorType;
//       //     e.user = sensor.user;
//       //     e.sensorName = sensor.sensorName;
//       //   } else
//       //     listTopic.value.add(History(
//       //         sensorName: e.sensorName,
//       //         user: e.user,
//       //         isStart: e.isStart,
//       //         sensorType: e.sensorType));
//       // });
//     }
//     update();
//   }

//   getChartDate() {
//     if (listChartData != null) listChartData.clear();
//     listTopic.value = listHistory.value.distinct((e) => e.sensorName).toList();
//     listTopic.value.forEach((e) {
//       listChartData
//           .add(ChartHistorySenSor(topic: e.sensorName, createdAt: e.date));
//     });
//     setCount();
//     update();
//   }

//   setCount() {
//     listHistory.value.forEach((elm) {
//       listChartData.forEach((element) {
//         if (elm.sensorName == element.topic && elm.isStart)
//           element.countEnable += 1;
//       });
//     });
//     listChartData.sort((a, b) => a.countEnable.compareTo(b.countEnable));
//   }

//   orderByMonth() {}

//   setImageForSensorHistory(History a) {
//     switch (a.sensorName) {
//       case "fan":
//         if (a.isStart) return "assets/fan_on.png";
//         return "assets/fan_off.png";
//       case "Motor pH":
//         if (a.isStart) return "assets/ph_on.png";
//         return "assets/ph_off.png";
//       case "air-conditioner":
//         if (a.isStart) return "assets/air_conditioner_on.png";
//         return "assets/air_connditoner_off.png";
//       case "fountain":
//         if (a.isStart) return "assets/fountain_on.png";
//         return "assets/fountain_off.png";
//       case "incandescent bulbs":
//         if (a.isStart) return "assets/icons/on.jpg";
//         return "assets/icons/off.jpg";
//       default:
//         return "assets/icons/temp.jpg";
//     }
//   }
// }
