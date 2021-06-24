import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_color.dart';

// Colors that we use in our app
const kPrimaryColor = Color(0xFF0C9869);
const kTextColor = Color(0xFF3C4046);
const kBackgroundColor = Color(0xFFF9F8FD);
final titleSize = ScreenUtil().setSp(18);
final subTitleSize = ScreenUtil().setSp(14);
final miniTitleSize = ScreenUtil().setSp(10);

final double kDefaultPadding = ScreenUtil().setHeight(20);
//Todo config theo ip v4
const String baseUrl = "http://127.0.0.1:3001/";
const String infoIots = "info-iots";
const String plants = "suggestion-plants";
const String history = "history";
const String loginUrl = "http://127.0.0.1:3001/login?";
const String signupUrl = "http://127.0.0.1:3001/signup?";
const String infoIotDevice = "info-iots-device";
const String infoIotAgriculture = "info-iots-agriculture";
//Todo config theo ip v4
const String mqttUrl = "broker.hivemq.com";
const int mqttPort = 1883; // APP
const String iotTopic = "iot";

// const String tracking = "http://localhost:3001/tracking";
int appConvertIntJson(dynamic value) {
  if (value == null) return null;
  if (value is double) return value.toInt();
  return value;
}

Center kLoadingSpinner = const Center(
  child: SpinKitCircle(
    color: Color(0xff008080),
    size: 50.0,
  ),
);
Widget loadding = SafeArea(
  child: Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
          kBackgroundColor,
          kPrimaryColor,
        ])),
    child: Center(
      child: CircularProgressIndicator(),
    ),
  ),
);
AppBar buildAppBar({@required BuildContext context, bool isBack = false}) {
  return AppBar(
    title: Text(
      "Smart IOT",
      style: TextStyle(fontSize: titleSize, color: kBackgroundColor),
    ),
    centerTitle: true,
    elevation: 0,
    leading: isBack
        ? BackButton(
            color: kBackgroundColor,
            onPressed: () => Navigator.of(context).pop(),
          )
        : IconButton(
            icon: SvgPicture.asset(
              "assets/icons/menu.svg",
              color: kBackgroundColor,
            ),
            onPressed: () {},
          ),
  );
}

void displayDialog(String title, String text) => Get.snackbar(
      "$title",
      "$text",
      snackPosition: SnackPosition.BOTTOM,
      colorText: AppColor.warning,
    );
getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}

setToken({String token}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("token", token);
}

removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Remove String
  prefs.remove("token");
}

Future<bool> checkExisToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  return prefs.containsKey('token');
}
