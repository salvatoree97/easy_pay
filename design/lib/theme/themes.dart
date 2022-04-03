import 'package:design/theme/base_button/custom_button_theme.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';

class Themes {
  ///[Light color scheme]
  static ThemeData get lightTheme {
    return ThemeData.from(
      colorScheme: ThemesStyleColorScheme.lightColorScheme,
      textTheme: ThemeStyleTextTheme.lightTextTheme,
    ).copyWith(
      inputDecorationTheme: ThemeStyleInputDecoration.lightInputDecorationTheme,
      elevatedButtonTheme: CustomButtonTheme.primaryElevatedButtonTheme,
      // appBarTheme: lightAppBarTheme,
      // radioTheme: _radioThemeData,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.from(
      colorScheme: ThemesStyleColorScheme.darkColorScheme,
      textTheme: ThemeStyleTextTheme.darkTextTheme,
    ).copyWith(
      inputDecorationTheme: ThemeStyleInputDecoration.lightInputDecorationTheme,
      elevatedButtonTheme: CustomButtonTheme.primaryElevatedButtonTheme,
      // appBarTheme: lightAppBarTheme,
      // radioTheme: _radioThemeData,
    );
  }
}

extension ThemeStyleInputDecoration on Themes {
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
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: radius,
      borderSide: BorderSide(color: CustomColors.red, width: 1.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: radius,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: radius,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: radius,
    ),
    errorMaxLines: 2,
    errorStyle: PoppinstTextStyle(
      fontDimension: Dimension.pt12,
    ),
  );
}

extension ThemesStyleColorScheme on Themes {
  static const lightColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.primaryBlue,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.secondaryGray,
    background: CustomColors.white,
    onBackground: CustomColors.white,
    surface: CustomColors.primaryBlue,
    onSurface: CustomColors.primaryBlue,
    error: CustomColors.red,
    onError: CustomColors.red,
    brightness: Brightness.light,
  );

  ///[Dark color scheme]
  static const darkColorScheme = ColorScheme(
    primary: CustomColors.primaryBlue,
    onPrimary: CustomColors.primaryBlue,
    secondary: CustomColors.secondaryGray,
    onSecondary: CustomColors.secondaryGray,
    background: CustomColors.white,
    onBackground: CustomColors.white,
    surface: CustomColors.primaryBlue,
    onSurface: CustomColors.primaryBlue,
    error: CustomColors.red,
    onError: CustomColors.red,
    brightness: Brightness.light,
  );
}

extension ThemeStyleTextTheme on Themes {
  static final TextTheme lightTextTheme =
      Typography.material2018().black.copyWith(
            headline1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 94,
            ),
            headline2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 60,
            ),
            headline3: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 48,
            ),
            headline4: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 32,
            ),
            headline5: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 24,
            ),
            headline6: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 20,
            ),
            subtitle1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 16,
            ),
            subtitle2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 14,
            ),
            bodyText1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 17,
            ),
            bodyText2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 14,
            ),
          );

  static final TextTheme darkTextTheme =
      Typography.material2018().black.copyWith(
            headline1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 94,
            ),
            headline2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 60,
            ),
            headline3: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 48,
            ),
            headline4: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 32,
            ),
            headline5: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 24,
            ),
            headline6: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 20,
            ),
            subtitle1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 16,
            ),
            subtitle2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 14,
            ),
            bodyText1: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 17,
            ),
            bodyText2: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 14,
            ),
          );
}
