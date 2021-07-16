import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/nav_bar/my_bottom_nav_bar.dart';
import '../../constants.dart';
import '../../model/history_model.dart';
import 'components/advance_item.dart';
import 'components/detail_sensor.dart';
import 'components/sensor_item.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends StatefulWidget {
  static void go({History history}) =>
      Get.to(() => new DashBoardScreen(history: history));
  final History history;
  DashBoardScreen({this.history});
  @override
  _AppStateMQTT createState() => _AppStateMQTT();
}

class _AppStateMQTT extends State<DashBoardScreen> {
  // khai báo thông số
  bool isChecked = false;
  TextEditingController messageServer = new TextEditingController();
  final DashBoardController dashBoardConntroller = Get.find();

  @override
  void initState() {
    setState(() {
      dashBoardConntroller.checkLastAction(widget.history);
      dashBoardConntroller.getSubSensor();
    });

    super.initState();
  }

  @override
  void dispose() {
    dashBoardConntroller.subSensor.nil();
    dashBoardConntroller.mainSensor.nil();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(builder: (controller) {
      // controller.getSubSensor(controller.subSensor.value);

      if (controller.subSensor.value == null ||
          controller.sonometerSensor.value.value == null ||
          controller.thermometerSensor.value.value == null ||
          controller.pressureSensor.value.value == null ||
          controller.temperatureSensor.value.value == null ||
          controller.windSensor.value.value == null ||
          controller.cloudSensor.value.value == null ||
          controller.rainSensor.value.value == null) {
        return loadding;
      }

      return Scaffold(
        appBar: buildAppBar(
          context: context,
          isBack: true,
        ),
        bottomNavigationBar: MyBottomNavBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              color: kBackgroundColor,
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 9,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SensorItem(),
                            itemBasic(controller),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2,
                                  vertical: kDefaultPadding / 2),
                              child: AdvanceItem(
                                content:
                                    "${controller.temperatureSensor.value.value}°C",
                                icon: "asset/thermometer.png",
                                title: "Nhiệt độ cảm nhận",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2,
                                  vertical: kDefaultPadding / 2),
                              child: AdvanceItem(
                                content:
                                    "${controller.cloudSensor.value.value}%",
                                icon: "asset/cloud.png",
                                title: "Tỷ lệ có mây",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2,
                                  vertical: kDefaultPadding / 2),
                              child: AdvanceItem(
                                content:
                                    "${controller.windSensor.value.value}m/s",
                                icon: "asset/wind_speed.png",
                                title: "Tốc độ gió",
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2,
                                  vertical: kDefaultPadding / 2),
                              child: AdvanceItem(
                                content:
                                    "${controller.pressureSensor.value.value}hPA",
                                icon: "asset/wind.png",
                                title: "Áp suất",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  Padding itemBasic(DashBoardController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding / 2, vertical: kDefaultPadding),
      child: Row(
        children: [
          AttributeWidget(
            color: const Color(0xffFF6724),
            title: 'Nhiệt độ',
            assetName: 'asset/thermometer_white.png',
            content: controller.thermometerSensor.value.value.toString() + "°C",
          ),
          const SizedBox(
            width: 10,
          ),
          AttributeWidget(
            color: const Color(0xff51B1FB),
            title: 'Mưa',
            assetName: 'asset/umbrella_white.png',
            content: controller.rainSensor.value.value.toString() + '%',
          ),
          const SizedBox(
            width: 10,
          ),
          AttributeWidget(
            color: const Color(0xffACDBFF),
            title: 'Độ ẩm',
            assetName: 'asset/umbrella_white.png',
            content: controller.sonometerSensor.value.value.toString() + '%',
          )
        ],
      ),
    );
  }
}
