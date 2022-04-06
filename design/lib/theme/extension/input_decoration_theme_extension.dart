import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:design/theme/themes.dart';
import 'package:flutter/material.dart';

extension InputDecorationThemeExtension on Themes {
  static const radius = BorderRadius.all(Radius.circular(10));
  static const searchRadius = BorderRadius.all(Radius.circular(27.0));

  static const InputDecorationTheme lightInputDecorationTheme =
      InputDecorationTheme(
    fillColor: CustomColors.secondaryGray,
    filled: true,
    labelStyle: TextStyle(
      color: CustomColors.black,
      fontFamily: PoppinstTextStyle.poppins,
      fontSize: Dimension.pt12,
    ),
    hintStyle: TextStyle(
      color: CustomColors.black,
      fontFamily: PoppinstTextStyle.poppins,
      fontWeight: FontWeight.normal,
      fontSize: Dimension.pt15,
    ),
    border: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.clear, width: 0.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.red, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.clear, width: 0.0),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.clear, width: 0.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.clear, width: 0.0),
    ),
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.always,
    errorMaxLines: 2,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    errorStyle: PoppinstTextStyle(
      fontDimension: Dimension.pt12,
    ),
  );
}
