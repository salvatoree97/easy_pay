import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/themes.dart';
import 'package:flutter/material.dart';

extension ColorSchemeExtension on Themes {
  static const lightColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.secondaryGray,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.primaryDarkBlue,
    background: CustomColors.white,
    onBackground: CustomColors.black,
    surface: CustomColors.primaryPetroilBlue,
    onSurface: CustomColors.primaryBlue,
    error: CustomColors.red,
    onError: CustomColors.white,
    brightness: Brightness.light,
  );

  ///[Dark color scheme]
  static const darkColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.primaryBlue,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.secondaryGray,
    background: CustomColors.black,
    onBackground: CustomColors.black,
    surface: CustomColors.primaryBlue,
    onSurface: CustomColors.primaryBlue,
    error: CustomColors.red,
    onError: CustomColors.red,
    brightness: Brightness.dark,
  );
}
