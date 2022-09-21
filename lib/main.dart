import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'binding.dart';
import 'constants.dart';
import 'route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? login;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => GetMaterialApp(
        initialBinding: BindingController(),
        debugShowCheckedModeBanner: false,
        title: 'IOT Support Application',
        theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          primaryColor: kPrimaryColor,
          textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        getPages: route(),
        initialRoute: '/login',
        // home: LoginPage()
        // // FutureBuilder<bool>(
        // //   future: checkExisToken(),
        // //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
        // //     if (snapshot.data == true) return HomeScreen();
        // //     return LoginPage();
        // //   },
        // // ),
        // ),
      ),
    );
  }
}
