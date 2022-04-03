import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';

///[BaseButtonStyle]
///Base button class that contains default text style
class BaseButtonStyle extends ButtonStyle {
  ///[defaultTextStyle] use Poppins font
  static final defaultTextStyle = MaterialStateProperty.all(
    const PoppinstTextStyle.withBold(fontDimension: 15),
  );

  ///[defaultPadding] for all buttons
  static final defaultPadding = MaterialStateProperty.all(
    const EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
  );

  ///[defaultShape] for all buttons with borderRadius
  static final defaultShape = MaterialStateProperty.all(
    RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
  );

  ///[defaultBackgroundColor] for all buttons with primary color
  static final defaultBackgroundColor =
      MaterialStateProperty.all(CustomColors.primaryBlue);

  ///[defaultForegroundColor] for all buttons with foreground color
  static final defaultForegroundColor =
      MaterialStateProperty.all(CustomColors.white);

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
              return CustomColors.clear; // Null to use the component's default.
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
              return CustomColors.clear; // Null to use the component's default.
            },
          ),
        );

  BaseButtonStyle.withBorderShape({
    backgroundColor,
    foregroundColor,
    required customBorderShape,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: defaultTextStyle,
          padding: defaultPadding,
          shape: customBorderShape,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return CustomColors.clear; // Null to use the component's default.
            },
          ),
        );

  BaseButtonStyle.withSide({
    backgroundColor,
    foregroundColor,
    required side,
  }) : super(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          textStyle: defaultTextStyle,
          padding: defaultPadding,
          side: side,
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              return CustomColors.clear; // Null to use the component's default.
            },
          ),
        );
}
