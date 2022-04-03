import 'package:flutter/cupertino.dart';

class SFProTextStyle extends TextStyle {
  static const fontSfPro = "SF-Pro-Display";

  final Color? color;
  final double? fontDimension;

  const SFProTextStyle({
    this.color,
    required this.fontDimension,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
        );

  const SFProTextStyle.withRegular({
    this.color,
    required this.fontDimension,
  }) : super(
            color: color,
            fontSize: fontDimension,
            fontFamily: fontSfPro,
            fontWeight: FontWeight.normal);

  const SFProTextStyle.withItalic({
    this.color,
    required this.fontDimension,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
          fontStyle: FontStyle.italic,
        );

  const SFProTextStyle.withMedium({
    this.color,
    required this.fontDimension,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
          fontWeight: FontWeight.w500,
        );

  const SFProTextStyle.withBold({
    this.color,
    required this.fontDimension,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
          fontWeight: FontWeight.bold,
        );

  const SFProTextStyle.withSemiBold({
    this.color,
    required this.fontDimension,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
          fontWeight: FontWeight.w600,
        );

  const SFProTextStyle.underlined({
    this.color,
    required this.fontDimension,
    FontWeight? fontWeight,
  }) : super(
          color: color,
          fontSize: fontDimension,
          fontFamily: fontSfPro,
          decoration: TextDecoration.underline,
          fontWeight: fontWeight ?? FontWeight.w500,
        );
}
