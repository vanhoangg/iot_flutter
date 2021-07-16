import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import '../dashboard_controller.dart';
import 'unicorn_button.dart';

class SensorItem extends StatefulWidget {
  SensorItem({
    Key key,
  }) : super(key: key);

  @override
  _SensorItemState createState() => _SensorItemState();
}

class _SensorItemState extends State<SensorItem> {
  @override
  Widget build(BuildContext context) {
    return GetX<DashBoardController>(builder: (controller) {
      controller.conecttMQTT(iotTopic);

      if (controller.mainSensor.value.isStart == null) return loadding;
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: kDefaultPadding / 2,
                  horizontal: kDefaultPadding / 2),
              child: Text(
                "Thông tin thiết bị".toUpperCase(),
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: titleSize,
                    color: kPrimaryColor),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
                  child: UnicornOutlineButton(
                    strokeWidth: 4,
                    radius: ScreenUtil.defaultSize.width / 12,
                    gradient: LinearGradient(
                      colors: [Color(0xff51B1FB), Color(0xffFF6724)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomCenter,
                    ),
                    child: Container(
                      child: SizedBox(
                        height: ScreenUtil().setHeight(50),
                        width: ScreenUtil().setWidth(50),
                        child: Image.asset(controller
                            .setImageForSensor(controller.mainSensor.value)),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        controller.onclick1(controller.mainSensor.value);
                      });
                    },
                  ),
                ),
                Column(
                  children: [
                    ItemDetailDashBoard(
                      title: "Tên người dùng",
                      value: controller.mainSensor.value.user,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    ItemDetailDashBoard(
                      title: "Tên thiết bị",
                      value: controller.mainSensor.value.sensorName,
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    ItemDetailDashBoard(
                      title: "Trạng thái",
                      value:
                          controller.mainSensor.value.isStart ? "Bật" : "Tắt",
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}

class ItemDetailDashBoard extends StatelessWidget {
  const ItemDetailDashBoard({
    Key key,
    @required this.title,
    @required this.value,
  }) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: titleSize,
              fontWeight: FontWeight.bold,
              color: kPrimaryColor.withOpacity(0.7)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: kDefaultPadding / 4),
          child: Text(
            value,
            style: TextStyle(fontSize: subTitleSize, color: kTextColor),
          ),
        ),
      ],
    );
  }
}
