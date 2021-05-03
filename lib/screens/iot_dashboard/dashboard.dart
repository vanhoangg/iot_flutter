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
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Color(0xFFF9F8FD),
                      Color(0xFFF9F8FD),
                    ])),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(children: [
                      Expanded(
                        child: IconButton(
                          padding:
                              EdgeInsets.symmetric(horizontal: kDefaultPadding),
                          icon: SvgPicture.asset("assets/icons/back_arrow.svg"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text("Smart IOT",
                              style: TextStyle(
                                  color: Color(0xFF0C9869),
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 4,
                            child: Row(
                              children: <Widget>[
                                Center(
                                  child: Switch(
                                    value: controller.mayLanh.value.isStart,
                                    onChanged: (value) {
                                      controller.onChangeSensor();
                                      setState(() {});
                                    },
                                    activeTrackColor: Color(0xFF0C9869),
                                    activeColor: Colors.black12,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ]),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SensorItem(
                            humidity: controller.mayLanh.value.name,
                          ),
                          SensorItem(),
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
