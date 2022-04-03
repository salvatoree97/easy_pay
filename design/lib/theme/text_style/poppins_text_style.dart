import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class PoppinstTextStyle extends TextStyle {
  static const poppins = "Poppins";

  @override
  Color? get color => CustomColors.black;
  final double? fontDimension;

  const PoppinstTextStyle({
    newColor,
    required this.fontDimension,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
        );

  const PoppinstTextStyle.withRegular({
    newColor,
    required this.fontDimension,
  }) : super(
            color: newColor,
            fontSize: fontDimension,
            fontFamily: poppins,
            fontWeight: FontWeight.normal);

  const PoppinstTextStyle.withItalic({
    newColor,
    required this.fontDimension,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
          fontStyle: FontStyle.italic,
        );

  const PoppinstTextStyle.withMedium({
    newColor,
    required this.fontDimension,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
          fontWeight: FontWeight.w500,
        );

  const PoppinstTextStyle.withBold({
    newColor,
    required this.fontDimension,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
          fontWeight: FontWeight.bold,
        );

  const PoppinstTextStyle.withSemiBold({
    newColor,
    required this.fontDimension,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
          fontWeight: FontWeight.w600,
        );

  const PoppinstTextStyle.underlined({
    newColor,
    required this.fontDimension,
    FontWeight? fontWeight,
  }) : super(
          color: newColor,
          fontSize: fontDimension,
          fontFamily: poppins,
          decoration: TextDecoration.underline,
          fontWeight: fontWeight ?? FontWeight.w500,
        );
}
