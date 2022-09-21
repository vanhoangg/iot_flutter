import 'package:flutter/material.dart';

import 'constants.dart';

class AppBtn extends StatelessWidget {
  final String? title;
  final Function? onTap;
  final Color? colorBg;
  final Color? colorText;
  final Color? borderColor;
  final double? height;
  final double? radius;
  final double? paddingBtnWidth;
  final double? paddingBtnHeight;
  final Icon? titleIcon;

  const AppBtn({
    Key? key,
    this.title,
    this.onTap,
    this.colorBg,
    this.colorText,
    this.height,
    this.borderColor,
    this.radius,
    this.paddingBtnWidth,
    this.paddingBtnHeight,
    this.titleIcon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap?.call(),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: paddingBtnWidth ?? 10,
            vertical: paddingBtnHeight ?? 10),
        height: height,
        decoration: BoxDecoration(
          color: colorBg,
          borderRadius: BorderRadius.circular(radius ?? 30),
          border: Border.all(color: borderColor ?? Colors.transparent),
        ),
        child: Center(
          child: titleIcon ??
              Text(
                title ?? "",
                style: TextStyle(
                  color: colorText,
                  fontSize: subTitleSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
        ),
      ),
    );
  }
}
