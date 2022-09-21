import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app_color.dart';
import '../../../constants.dart';
import '../../authen/controller/auth_controller.dart';

class FieldProfileItem extends StatelessWidget {
  const FieldProfileItem({
    Key? key,
    required this.controller,
    this.title,
    this.labelText,
    // this.editingController,
    this.value,
    this.onOK,
    this.isEnable = false,
    this.inputType = TextInputType.text,
  }) : super(key: key);

  final AuthController controller;
  final String? title, labelText, value;
  final Function(String)? onOK;
  final bool isEnable;
  final TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Text(labelText ?? ""),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kDefaultPadding, vertical: kDefaultPadding),
          child: InkWell(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding / 2,
                  vertical: kDefaultPadding / 2),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColor.grey),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(value ?? ""),
            ),
            onTap: isEnable
                ? () {
                    var nickname = TextEditingController();
                    nickname.text = value ?? "";
                    Get.defaultDialog(
                      title: title ?? "",
                      content: ItemProfileTextField(
                        isFocus: true,
                        inputType: inputType,
                        labelText: labelText ?? "",
                        isEnable: true,
                        editingController: nickname,
                      ),
                      confirm: ElevatedButton(
                        onPressed: () => onOK?.call(nickname.text),
                        child: const Text('OK'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColor.primary,
                        ),
                      ),
                    );
                  }
                : () {},
          ),
        ),
      ],
    );
  }
}

class ItemProfileTextField extends StatelessWidget {
  final String? label, hintText, labelText;
  final bool? isEnable, isPassword, isFocus;
  final double? paddingHorizontal, paddingVertical;
  final TextEditingController? editingController;
  final TextInputType? inputType;

  // final Voidcal
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
    // this.callBack,
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
            // onSubmitted: (_) => callBack(_),
          ),
        ],
      ),
    );
  }
}
