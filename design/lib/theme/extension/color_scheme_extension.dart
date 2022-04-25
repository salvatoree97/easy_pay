import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/themes.dart';
import 'package:flutter/material.dart';

extension ColorSchemeExtension on Themes {
  static const lightColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.secondaryGray,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.primaryDarkBlue,
    tertiary: CustomColors.primaryUltraLightBlue,
    onTertiary: CustomColors.primaryPetroilBlue,
    background: CustomColors.white,
    onBackground: CustomColors.primaryDarkBlue,
    surface: CustomColors.primaryPetroilBlue,
    onSurface: CustomColors.primaryLighBlue,
    error: CustomColors.red,
    onError: CustomColors.white,
    brightness: Brightness.light,
  );

  ///[Dark color scheme]
  static const darkColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.secondaryGray,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.primaryDarkBlue,
    background: CustomColors.primaryDarkBlue,
    onBackground: CustomColors.secondaryGray,
    surface: CustomColors.primaryBlue,
    onSurface: CustomColors.primaryBlue,
    error: CustomColors.red,
    onError: CustomColors.red,
    brightness: Brightness.dark,
  );
}
