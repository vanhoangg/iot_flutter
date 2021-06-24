import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_btn.dart';
import '../../app_color.dart';
import '../../constants.dart';
import '../authen/controller/auth_controller.dart';
import 'components/field_profile_items.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(isBack: true, context: context),
      body: SingleChildScrollView(
        child: GetX<AuthController>(builder: (controller) {
          if (controller.userProfile.value.profile == null) return loadding;
          return Container(
            padding: EdgeInsets.symmetric(
                vertical: kDefaultPadding, horizontal: kDefaultPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
                  child: CircleAvatar(
                      backgroundColor: AppColor.grey,
                      radius: 45,
                      // onBackgroundImageError: ,
                      backgroundImage:
                          // avatar == null   ?
                          AssetImage("assets/icons/mqtt.jpg")
                      // : NetworkImage(avatar)
                      ),
                ),
                // AvatarBanner(
                //   avatar: controller.userProfile.value.first.avatar,
                // ),
                FieldProfileItem(
                  controller: controller,
                  title: "Tên đăng nhập",
                  labelText: "Tên đăng nhập",
                  value: controller.userProfile.value.profile.userName ?? "",
                ),
                FieldProfileItem(
                    controller: controller,
                    title: "Email",
                    labelText: "Email",
                    value:
                        controller.userProfile.value.profile.email ?? "Email"),
                FieldProfileItem(
                  controller: controller,
                  title: "Điện thoại",
                  labelText: "Điện thoại",
                  value: controller.userProfile.value.profile.phoneNumber ?? "",
                ),
                FieldProfileItem(
                  controller: controller,
                  title: "Địa chỉ",
                  labelText: "Địa chỉ",
                  value: controller.userProfile.value.profile.address ?? "",
                ),

                // Container(
                //   padding:
                //       EdgeInsets.symmetric(horizontal: kConstantPadding * 2),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Text("Mật khẩu"),
                //       const SizedBox(height: 5),
                //       AppBtn(
                //         title: 'Đổi mật khẩu',
                //         onTap: () {
                //           final currentPassword = TextEditingController();
                //           final newPassword = TextEditingController();
                //           final reNewPassword = TextEditingController();
                //           Get.defaultDialog(
                //             title: '',
                //             content: Container(
                //               padding: EdgeInsets.symmetric(
                //                   vertical: kConstantPadding),
                //               child: SingleChildScrollView(
                //                 child: Column(
                //                   children: [
                //                     Padding(
                //                       padding: EdgeInsets.only(
                //                           bottom: kConstantPadding * 2),
                //                       child: Text(
                //                         "đổi mật khẩu".toUpperCase(),
                //                         style: TextStyle(
                //                           color: AppColor.primary,
                //                           fontSize: titleSize,
                //                           fontWeight: FontWeight.bold,
                //                         ),
                //                       ),
                //                     ),
                //                     ItemProfileTextField(
                //                       isPassword: true,
                //                       editingController: currentPassword,
                //                       labelText: "Nhập lại mật khẩu cũ",
                //                       hintText: '',
                //                       isEnable: true,
                //                       paddingVertical: 0,
                //                       paddingHorizontal: kConstantPadding * 2,
                //                     ),
                //                     SizedBox(height: kConstantPadding),
                //                     ItemProfileTextField(
                //                       isPassword: true,
                //                       editingController: newPassword,
                //                       labelText: "Nhập mật khẩu mới",
                //                       hintText: '',
                //                       isEnable: true,
                //                       paddingVertical: 0,
                //                       paddingHorizontal: kConstantPadding * 2,
                //                     ),
                //                     SizedBox(height: kConstantPadding),
                //                     ItemProfileTextField(
                //                       isPassword: true,
                //                       editingController: reNewPassword,
                //                       labelText: "Nhập lại mật khẩu mới",
                //                       hintText: '',
                //                       isEnable: true,
                //                       paddingVertical: 0,
                //                       paddingHorizontal: kConstantPadding * 2,
                //                     ),
                //                     SizedBox(height: kConstantPadding / 2),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //             barrierDismissible: false,
                //             confirm: ElevatedButton(
                //               onPressed: () =>
                //                   _profileController.eventChangePassword(
                //                 oldPass: currentPassword.text,
                //                 newPass: newPassword.text,
                //                 reNewPass: reNewPassword.text,
                //               ),
                //               child: Text('Đổi mật khẩu'),
                //               style: ElevatedButton.styleFrom(
                //                 primary: AppColor.primary,
                //               ),
                //             ),
                //             cancel: ElevatedButton(
                //               onPressed: () => Get.back(),
                //               child: Text('Hủy'),
                //               style: ElevatedButton.styleFrom(
                //                 primary: Colors.red,
                //               ),
                //             ),
                //           );
                //         },
                //         borderColor: AppColor.primary,
                //         radius: 5,
                //         colorText: AppColor.primary,
                //       ),
                //     ],
                //   ),
                // ),
                SizedBox(height: kDefaultPadding * 2),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
                  child: AppBtn(
                    title: 'Đăng xuất',
                    onTap: () {
                      Get.defaultDialog(
                        title: "Xác nhận đăng xuất",
                        content: SizedBox(
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                onPressed: () async {
                                  await controller.logout();
                                },
                                child: Text("OK"),
                                style: ElevatedButton.styleFrom(
                                    primary: kPrimaryColor),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text("Hủy"),
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    colorBg: kPrimaryColor,
                    radius: 5,
                    colorText: Colors.white,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
