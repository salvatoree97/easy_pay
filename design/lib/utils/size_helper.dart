import 'package:flutter/material.dart';

class SizeHelper {
  static late double screenHeight;
  static late double screenWidth;
  static late double screenTopPadding;
  static late double screenBottomPadding;
  static late double screenAspectRatio;

  static void init(MediaQueryData data) {
    screenHeight = data.size.height;
    screenWidth = data.size.width;
    screenTopPadding = data.padding.top;
    screenBottomPadding = data.padding.bottom;
    screenAspectRatio = data.size.aspectRatio;
  }

  static double hp(double value) {
    return value * (screenHeight) / 100;
  }

  static double wp(double value) => value * (screenWidth) / 100;
}
