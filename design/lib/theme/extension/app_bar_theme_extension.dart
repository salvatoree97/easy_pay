import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/themes.dart';
import 'package:flutter/material.dart';

extension AppBarThemeExtensions on Themes {
  static const AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: CustomColors.white,
    foregroundColor: CustomColors.primaryDarkBlue,
    elevation: 0.0,
  );

  static const AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: CustomColors.primaryDarkBlue,
    foregroundColor: CustomColors.white,
    elevation: 0.0,
  );
}
