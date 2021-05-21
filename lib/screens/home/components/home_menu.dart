import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/constants.dart';
import 'package:iot_flutter/screens/history/history_page.dart';
import 'package:iot_flutter/screens/iot_dashboard/dashboard.dart';

class DashBoardItem extends StatelessWidget {
  const DashBoardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: kPrimaryColor)),
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding * 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(
                    child: _buildBtn('Nhà kho', 'icons/17.jpg',
                        onTap: () => Get.to(DashBoardScreen()))),
                Expanded(
                  child: _buildBtn('Tin tức', 'icons/cloud.jpg'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                Expanded(child: _buildBtn('Giống cây', 'icons/11.jpg')),
                Expanded(
                    child: _buildBtn('Thống kê', 'btn5.png',
                        onTap: () => Get.to(HistoryPage()))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

_buildBtn(String text, String image, {Function onTap}) {
  return InkWell(
    onTap: onTap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          height: ScreenUtil().setWidth(33),
          width: ScreenUtil().setWidth(33),
          child: Stack(
            children: [
              Image.asset('assets/$image'),
            ],
          ),
        ),
        SizedBox(
          height: ScreenUtil().setWidth(33),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}
