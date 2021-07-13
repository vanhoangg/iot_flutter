import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import 'screens/authen/controller/auth_controller.dart';
import 'screens/home/home_controller.dart';

class BindingController extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<HomeController>(HomeController(), permanent: true);
    // Get.put<DashBoardController>(DashBoardController(), permanent: true);
    // Timer(Duration(seconds: 5),
    //     () => Get.put<HistoryController>(HistoryController(), permanent: true));
  }
}
