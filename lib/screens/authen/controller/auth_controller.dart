import 'package:get/get.dart';

import '../../../app_color.dart';
import '../../../constants.dart';
import '../../../model/authen_model.dart';
import '../../../repository/authen.repo.dart';
import '../../home/home_screen.dart';
import '../login_page.dart';

class AuthController extends GetxController {
  final AuthRepository authRepository = AuthRepository();
  var userProfile = Rx<Auth>(Auth());
  var statusCode = Rx<String>("");
  var isLogin = false.obs;
  login({required String username, required String password}) async {
    String? token;
    await authRepository
        .login(user: username, password: password)
        .then((value) {
      if (value is Auth) {
        userProfile.value = value;
        token = value.token;
      } else {
        statusCode.value = value.toString();
      }
    });
    if (token != null) {
      setToken(token: token ?? "");
      Get.to(() => const HomeScreen());
      Get.snackbar(
        "Đăng nhập thành công",
        "Chào mừng ${userProfile.value.profile?.userName} đã đến với ứng dụng hỗ trợ iot trong nông nghiệp",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColor.primary,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "Đã có lỗi xảy ra",
        "Vui lòng đăng nhập lại".toUpperCase(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColor.primary,
        duration: const Duration(seconds: 3),
      );
    }
  }

  reg({required Profile user}) async {
    String? token;
    await authRepository.reg(user: user).then((value) {
      if (value is Auth) {
        userProfile.value = value;
        token = value.token;
      } else {
        statusCode.value = value.toString();
      }
    });
    if (token != null) {
      setToken(token: token ?? "");
      Get.to(() => const HomeScreen());
      Get.snackbar(
        "Đăng nhập thành công",
        "Chào mừng ${userProfile.value.profile?.userName} đã đến với ứng dụng hỗ trợ iot trong nông nghiệp",
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColor.primary,
        duration: const Duration(seconds: 3),
      );
    } else if (statusCode.value == "409") {
      displayDialog("Tên tài khoản đã có người sử dụng",
          "Vui lòng thử lại bằng tên tài khoản khác hoặc đăng nhập với tài khoản đã đăng ký.");
    } else {
      Get.snackbar(
        "Đã có lỗi xảy ra",
        "Vui lòng đăng nhập lại".toUpperCase(),
        snackPosition: SnackPosition.BOTTOM,
        colorText: AppColor.primary,
        duration: const Duration(seconds: 3),
      );
    }
  }

  // login({String username, String password}) async {
  //   var token;
  //   await authRepository
  //       .login(user: username, password: password)
  //       .then((value) {
  //     if (value is Auth) {
  //       userProfile.value = value;
  //       token = value.token;
  //     } else
  //       statusCode.value = value.toString();
  //   });
  //   if (token != null) {
  //     setToken(token: token);
  //     Get.to(HomeScreen());
  //     Get.snackbar(
  //       "Đăng nhập thành công",
  //       "Chào mừng ${userProfile.value.profile.userName} đã đến với ứng dụng hỗ trợ iot trong nông nghiệp",
  //       snackPosition: SnackPosition.BOTTOM,
  //       colorText: AppColor.primary,
  //       duration: Duration(seconds: 3),
  //     );
  //   } else
  //     Get.snackbar(
  //       "Đã có lỗi xảy ra",
  //       "Vui lòng đăng nhập lại".toUpperCase(),
  //       snackPosition: SnackPosition.BOTTOM,
  //       colorText: AppColor.primary,
  //       duration: Duration(seconds: 3),
  //     );
  // }

  checkLogin() {
    if (userProfile.value.token != null) {
      return isLogin.value = true;
    } else if (getToken() != null) {
      return isLogin.value = true;
    }
    return isLogin.value = false;
  }

  logout() async {
    isLogin.value = false;
    removeToken();
    await Get.offAll(() => const LoginPage());
    Get.forceAppUpdate();
  }
  // reg() async{
  //   await auth
  // }
}
