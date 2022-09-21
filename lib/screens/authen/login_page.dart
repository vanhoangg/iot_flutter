import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../app_btn.dart';
import '../../app_color.dart';
import '../../constants.dart';
import 'controller/auth_controller.dart';
import 'reg_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameEditingController = TextEditingController();

  final _passwordEditingController = TextEditingController();

  final AuthController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/icons/mqtt.jpg"),
              fit: BoxFit.fill,
            ),
          ),
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
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: kDefaultPadding,
                              child: SizedBox(
                                width: ScreenUtil.defaultSize.width,
                                child: Align(
                                  alignment: Alignment.topCenter,
                                  child: SizedBox(
                                    width: ScreenUtil.defaultSize.width / 4,
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
                          "Đăng nhập".toUpperCase(),
                          style: TextStyle(
                            fontSize: titleSize,
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      ItemProfileTextField(
                        editingController: _usernameEditingController,
                        labelText: "Tên đăng nhập hoặc email",
                        hintText: '',
                        isEnable: true,
                        paddingVertical: 0,
                        paddingHorizontal: kDefaultPadding * 2,
                      ),
                      ItemProfileTextField(
                        editingController: _passwordEditingController,
                        labelText: "Mật khẩu",
                        hintText: '',
                        isEnable: true,
                        isPassword: true,
                        paddingHorizontal: kDefaultPadding * 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding * 2,
                        ),
                        child: AppBtn(
                            colorBg: kPrimaryColor,
                            title: "Đăng nhập",
                            colorText: Colors.white,
                            radius: 5,
                            onTap: () async {
                              await controller.login(
                                  username: _usernameEditingController.text,
                                  password: _passwordEditingController.text);
                              setState(() {
                                controller.checkLogin();
                              });
                            }),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: kDefaultPadding,
                          horizontal: kDefaultPadding * 2,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              child: const Padding(
                                padding: EdgeInsets.all(5),
                                child: Text("Đăng ký"),
                              ),
                              onTap: () => Get.to(RegistrationPage()),
                              // RegistrationPage.push(context,
                              //     onRegistrationSuccess:
                              //         () {}),
                            ),
                          ],
                        ),
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

class ItemProfileTextField extends StatelessWidget {
  final String? label, hintText, labelText;
  final bool? isEnable, isPassword, isFocus;
  final double? paddingHorizontal, paddingVertical;
  final TextEditingController? editingController;
  final TextInputType? inputType;

  final void Function(String)? callBack;
  const ItemProfileTextField({
    Key? key,
    this.label,
    this.hintText,
    this.isEnable = false,
    this.labelText,
    this.isPassword = false,
    this.paddingHorizontal,
    this.paddingVertical,
    this.editingController,
    this.inputType = TextInputType.text,
    this.isFocus = false,
    this.callBack,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // FocusScope.of(context).requestFocus(focusNode);
    // editingController.
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: paddingHorizontal ?? kDefaultPadding,
          vertical: paddingVertical ?? kDefaultPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            autofocus: isFocus ?? false,
            keyboardType: inputType,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(width: 1, color: AppColor.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              labelText: labelText ?? '',
              alignLabelWithHint: true,
              hintText: hintText ?? 'Nhập họ và tên',
              contentPadding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
            ),
            controller: editingController,
            enabled: isEnable,
            obscureText: isPassword ?? false,
            onSubmitted: (_) => callBack?.call(_),
          ),
        ],
      ),
    );
  }
}
