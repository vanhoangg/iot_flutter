import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants.dart';
import 'info_iot.dart';

class MenuItemDashBoard extends StatelessWidget {
  const MenuItemDashBoard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding, vertical: kDefaultPadding),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 2, color: kPrimaryColor)),
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                // Expanded(
                //     child: _buildBtn('Nhà kho', 'icons/17.jpg',
                //         onTap: () => Get.to(StorePage()))),
                Expanded(
                  child: _buildBtn('Tin tức', 'icons/cloud.jpg',
                      onTap: () => Get.to(const InfoPage())),
                ),
              ],
            ),
          ),
          SizedBox(
            height: ScreenUtil().setHeight(30),
          ),
          // Container(
          //   padding: EdgeInsets.symmetric(vertical: 10),
          //   child: Row(
          //     children: [
          //       Expanded(
          //           child: _buildBtn('Thống kê', 'btn5.png',
          //               onTap: () => Get.to(HistoryPage()))),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

_buildBtn(String text, String image, {required Function onTap}) {
  return InkWell(
    onTap: onTap.call(),
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
            style: TextStyle(
                fontSize: titleSize,
                color: kPrimaryColor,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    ),
  );
}
