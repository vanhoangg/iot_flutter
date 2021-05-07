import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/model/air-conditioner_model.dart';
import 'package:iot_flutter/screens/iot_dashboard/components/unicorn_button.dart';
import 'package:iot_flutter/screens/iot_dashboard/dashboard_controller.dart';

class SensorItem extends StatefulWidget {
  final Sensor value;
  final String type;

  SensorItem({Key key, this.value, this.type}) : super(key: key);

  @override
  _SensorItemState createState() => _SensorItemState();
}

class _SensorItemState extends State<SensorItem> {
  final DashBoardController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        children: [
          UnicornOutlineButton(
            strokeWidth: 4,
            radius: size.width / 2,
            gradient: LinearGradient(
              colors: [Colors.red, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            child: Container(
              child: controller.getType(widget.value.isStart),
            ),
            onPressed: () {
              setState(() {
                controller.onclick1();
              });
            },
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tên người dùng : ${widget.value.user}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Nhiệt độ : ${widget.value.temperature}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Độ ẩm : ${widget.value.humidity}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "Trạng thái : ${widget.value.isStart}",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      // ElevatedButton(
      //   style: ElevatedButton.styleFrom(
      //       shape: CircleBorder(), primary: Colors.black.withOpacity(0.05)),
      //   child: Container(
      //     width: MediaQuery.of(context).size.width / 3,
      //     height: MediaQuery.of(context).size.width / 3,
      //     alignment: Alignment.center,
      //     decoration: BoxDecoration(shape: BoxShape.circle),
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Image.asset("assets/icons/9.jpg"),
      //         Text(
      //           "15 g/m3",
      //           style: TextStyle(color: Colors.black),
      //         ),
      //       ],
      //     ),
      //   ),
      //   onPressed: () {},
      // ),
    );
  }
}
