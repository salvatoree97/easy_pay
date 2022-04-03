import 'package:design/text_style/sf_pro_text_style.dart';
import 'package:flutter/material.dart';

///BaseButtonStyle
///
///Base button class that contains default text style
class BaseButtonStyle extends ButtonStyle {
  static final MaterialStateProperty<TextStyle?> defaultTextStyle =
      MaterialStateProperty.all(
    const SFProTextStyle.withBold(fontDimension: 15),
  );

  static final defaultPadding = MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
  );

  static final defaultShape = MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  static final defaultBackgroundColor =
      MaterialStateProperty.all(Colors.blueAccent);

  static final defaultForegroundColor =
      MaterialStateProperty.all(Colors.blueAccent);

  BaseButtonStyle({
    required backgroundColor,
    required foregroundColor,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: defaultTextStyle,
          padding: defaultPadding,
          shape: defaultShape,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Colors.transparent; // Null to use the component's default.
            },
          ),
        );

  BaseButtonStyle.withTextStyle({
    backgroundColor,
    foregroundColor,
    required textStyle,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: textStyle ?? defaultTextStyle,
          padding: defaultPadding,
          shape: defaultShape,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Colors.transparent; // Null to use the component's default.
            },
          ),
        );

  BaseButtonStyle.withBorderShape({
    backgroundColor,
    foregroundColor,
    customBorderShape,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: defaultTextStyle,
          padding: defaultPadding,
          shape: customBorderShape,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Colors.transparent; // Null to use the component's default.
            },
          ),
        );

  BaseButtonStyle.withSide({
    backgroundColor,
    foregroundColor,
    side,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: defaultTextStyle,
          padding: defaultPadding,
          side: side,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return Colors.transparent; // Null to use the component's default.
            },
          ),
        );
}
