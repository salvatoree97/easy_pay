import 'package:design/theme/color/custom_colors.dart';
import 'package:design/theme/dimension/dimension.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:design/theme/themes.dart';
import 'package:flutter/material.dart';

extension TextThemeExtension on Themes {
  static final TextTheme lightTextTheme =
      Typography.material2018().black.copyWith(
            titleLarge: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: Dimension.pt24,
            ),
            titleMedium: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: Dimension.pt20,
            ),
            titleSmall: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: Dimension.pt16,
            ),
            displayLarge: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 94,
            ),
            displayMedium: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 60,
            ),
            displaySmall: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 24,
            ),
            headlineLarge: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 48,
            ),
            headlineMedium: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 36,
            ),
            headlineSmall: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 20,
            ),
            bodyLarge: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 22,
            ),
            bodyMedium: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 17,
            ),
            bodySmall: const PoppinstTextStyle(
              newColor: CustomColors.black,
              fontDimension: 14,
            ),
            labelLarge: const PoppinstTextStyle(
              newColor: CustomColors.grey,
              fontDimension: 22,
            ),
            labelSmall: const PoppinstTextStyle(
              newColor: CustomColors.grey,
              fontDimension: 16,
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
