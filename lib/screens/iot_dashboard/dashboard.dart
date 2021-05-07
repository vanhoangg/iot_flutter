import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import 'components/sensor_item.dart';
import 'dashboard_controller.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _AppStateMQTT createState() => _AppStateMQTT();
}

class _AppStateMQTT extends State<DashBoardScreen> {
  // khai báo thông số
  bool isChecked = false;
  TextEditingController messageServer = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(
        init: DashBoardController(),
        builder: (controller) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      kBackgroundColor,
                      kPrimaryColor,
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          padding: EdgeInsets.symmetric(
                              horizontal: kDefaultPadding / 2),
                          icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Smart IOT",
                              style: TextStyle(
                                  color: Color(0xFF0C9869),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ]),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SensorItem(
                            value: controller.sensor.value,
                            type: "humi",
                          ),
                          SensorItem(
                            value: controller.sensor.value,
                            type: "temp",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
