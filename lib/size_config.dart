import 'dart:ui';

import 'package:flutter/widgets.dart';

// Inspire by https://pub.dev/packages/flutter_screenutil
class SizeConfig {
  static double _heightDevice;
  static double _widthDevice;

  static double _designWidth;
  static double _designHeight;

  static double get heightDevice => _heightDevice;
  static double get widthDevice => _widthDevice;

  static init({@required double designWidth, @required double designHeight}) {
    _designWidth = designWidth;
    _designHeight = designHeight;
    _heightDevice = window.physicalSize.height / window.devicePixelRatio;
    _widthDevice = window.physicalSize.width / window.devicePixelRatio;
  }

  static double setWidth(double width) => width * (_widthDevice / _designWidth);

  static double setHeight(double height) =>
      height * (_heightDevice / _designHeight);

  static double getScreenHeight(double inputHeight) {
    double screenHeight = SizeConfig._heightDevice;
    return (inputHeight / 667) * screenHeight;
  }

  static double getScreenWidth(double inputWidth) {
    double screenWidth = SizeConfig._widthDevice;
    return (inputWidth / 375) * screenWidth;
  }
}
