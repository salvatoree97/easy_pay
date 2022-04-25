import 'package:design/theme/base_button/custom_button_theme.dart';
import 'package:design/theme/extension/app_bar_theme_extension.dart';
import 'package:design/theme/extension/color_scheme_extension.dart';
import 'package:design/theme/extension/input_decoration_theme_extension.dart';
import 'package:design/theme/extension/radio_theme_extension.dart';
import 'package:design/theme/extension/tab_bar_theme_extension.dart';
import 'package:design/theme/extension/text_theme_extension.dart';
import 'package:flutter/material.dart';

class Themes {
  ///[Light color scheme]
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ColorSchemeExtension.lightColorScheme,
      textTheme: TextThemeExtension.lightTextTheme,
    ).copyWith(
      inputDecorationTheme:
          InputDecorationThemeExtension.lightInputDecorationTheme,
      elevatedButtonTheme: CustomButtonTheme.primaryElevatedButtonTheme,
      appBarTheme: AppBarThemeExtensions.lightAppBarTheme,
      tabBarTheme: TabBarThemeExtension.lightTabBarTheme,
      radioTheme: RadioThemeExtension.lightRadioTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.from(
      colorScheme: ColorSchemeExtension.darkColorScheme,
      textTheme: TextThemeExtension.darkTextTheme,
    ).copyWith(
      inputDecorationTheme:
          InputDecorationThemeExtension.lightInputDecorationTheme,
      elevatedButtonTheme: CustomButtonTheme.primaryElevatedButtonTheme,
      appBarTheme: AppBarThemeExtensions.darkAppBarTheme,
      tabBarTheme: TabBarThemeExtension.darkTabBarTheme,
      radioTheme: RadioThemeExtension.darkRadioTheme,
    );
  }
}
