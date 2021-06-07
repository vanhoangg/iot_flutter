import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:iot_flutter/screens/home/home_screen.dart';

import 'screens/authen/login_page.dart';

route() => [
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => LoginPage()),
    ];
