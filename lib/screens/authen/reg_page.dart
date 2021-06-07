import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iot_flutter/model/authen_model.dart';

import '../../app_btn.dart';
import '../../constants.dart';
import 'controller/auth_controller.dart';
import 'login_page.dart';

class RegistrationPage extends GetWidget<AuthController> {
  final usernameE = TextEditingController();
  final emailE = TextEditingController();
  final phoneE = TextEditingController();
  final passE = TextEditingController();
  final addressE = TextEditingController();
  static void go() {
    Get.to(RegistrationPage());
  }

  RegistrationPage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Wrap(
              children: [
                Container(
                  width: ScreenUtil.defaultSize.width,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: kPrimaryColor),
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        width: ScreenUtil.defaultSize.width,
                        height: 100,
                        child: Stack(
                          overflow: Overflow.visible,
                          children: [
                            Positioned(
                              top: -50,
                              child: SizedBox(
                                width: ScreenUtil.defaultSize.width,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Container(
                                    width: ScreenUtil.defaultSize.width / 2,
                                    child: Image.asset(
                                      "assets/icons/mqtt.jpg",
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: kDefaultPadding),
                        child: Text(
                          "Đăng ký".toUpperCase(),
                          style: TextStyle(
                            fontSize: titleSize,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ItemProfileTextField(
                        labelText: "Tên tài khoản",
                        hintText: '',
                        isEnable: true,
                        paddingVertical: 0,
                        paddingHorizontal: kDefaultPadding * 2,
                        editingController: usernameE,
                      ),
                      ItemProfileTextField(
                        labelText: "Email",
                        hintText: '',
                        isEnable: true,
                        paddingHorizontal: kDefaultPadding * 2,
                        editingController: emailE,
                      ),
                      ItemProfileTextField(
                        labelText: "Số điện thoại",
                        hintText: '',
                        isEnable: true,
                        // isPassword: true,
                        paddingVertical: 3,
                        inputType: TextInputType.phone,
                        paddingHorizontal: kDefaultPadding * 2,
                        editingController: phoneE,
                      ),
                      ItemProfileTextField(
                        labelText: "Mật khẩu",
                        hintText: '',
                        isEnable: true,
                        isPassword: true,
                        paddingHorizontal: kDefaultPadding * 2,
                        editingController: passE,
                      ),
                      ItemProfileTextField(
                        labelText: "Địa chỉ",
                        hintText: '',
                        isEnable: true,
                        // isPassword: true,
                        paddingHorizontal: kDefaultPadding * 2,
                        paddingVertical: 0,
                        editingController: addressE,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding * 2,
                        ),
                        child: AppBtn(
                            colorBg: kPrimaryColor,
                            title: "Đăng ký",
                            colorText: Colors.white,
                            radius: 5,
                            onTap: () {
                              Profile profile = Profile(
                                  id: Random(100).toString(),
                                  userName: usernameE.text,
                                  password: passE.text,
                                  email: emailE.text,
                                  phoneNumber: phoneE.text,
                                  address: addressE.text);

                              if (profile.userName == null ||
                                  profile.userName.length < 4)
                                displayDialog("Tài khoản không hợp lệ",
                                    "Tên tài khoản phải dài hơn 4 kí tự và không được bỏ trống");
                              else if (profile.password == null ||
                                  profile.password.length < 4)
                                displayDialog("Mật khẩu không hợp lệ",
                                    "Mật khẩu phải dài hơn 4 kí tự và không được bỏ trống");
                              else if (profile.phoneNumber == null ||
                                  profile.phoneNumber.length < 10)
                                displayDialog("Số điện thoại không hợp lệ",
                                    "Số điện thoại phải trên 10 số và không được bỏ trống");
                              else if (profile.email == null)
                                displayDialog("Email không hợp lệ",
                                    "Email không được bỏ trống");
                              else if (profile.address == null)
                                displayDialog("Địa chỉ không hợp lệ",
                                    "Địa chỉ không được bỏ trống");
                              else {
                                controller.reg(user: profile);
                              }
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
