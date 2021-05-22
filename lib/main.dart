import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/screens/home/home_screen.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Plant App',
              theme: ThemeData(
                scaffoldBackgroundColor: kBackgroundColor,
                primaryColor: kPrimaryColor,
                textTheme:
                    Theme.of(context).textTheme.apply(bodyColor: kTextColor),
                visualDensity: VisualDensity.adaptivePlatformDensity,
              ),
              home: HomeScreen(),
            ));
  }
}
