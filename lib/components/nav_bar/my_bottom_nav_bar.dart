import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../screens/authen/controller/auth_controller.dart';
import '../../screens/authen/login_page.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/profile/profile_page.dart';

class MyBottomNavBar extends StatelessWidget {
  MyBottomNavBar({
    Key key,
  }) : super(key: key);
  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: kDefaultPadding * 2,
        right: kDefaultPadding * 2,
      ),
      height: 50,
      decoration: BoxDecoration(
        color: kBackgroundColor,
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
              icon: SvgPicture.asset(
                "assets/icons/flower.svg",
                color: kPrimaryColor,
              ),
              onPressed: () => Get.off(() => HomeScreen()),
            ),
          ),
          VerticalDivider(
            width: 5,
            thickness: 2,
          ),
          Expanded(
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/icons/user-icon.svg",
                color: kPrimaryColor,
              ),
              onPressed: () {
                controller.checkLogin();
                controller.isLogin.value
                    ? Get.to(() => ProfilePage())
                    : Get.to(() => LoginPage());
              },
            ),
          ),
        ],
      ),
    );
  }
}
