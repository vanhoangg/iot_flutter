import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/screens/history/history_page.dart';

import '../../constants.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -10),
            blurRadius: 35,
            color: kPrimaryColor.withOpacity(0.38),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/flower.svg"),
              onPressed: () {
                Get.back();
              },
            ),
          ),
          VerticalDivider(
            width: 5,
            thickness: 2,
          ),
          Expanded(
            child: IconButton(
              icon: SvgPicture.asset("assets/icons/user-icon.svg"),
              onPressed: () {
                Get.to(HistoryPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
