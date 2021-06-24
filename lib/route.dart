import 'package:get/get_navigation/src/routes/get_route.dart';

import 'screens/authen/login_page.dart';
import 'screens/home/home_screen.dart';

route() => [
      GetPage(name: '/', page: () => HomeScreen()),
      GetPage(name: '/login', page: () => LoginPage()),
    ];
