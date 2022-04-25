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
            titleLarge: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: Dimension.pt24,
            ),
            titleMedium: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: Dimension.pt20,
            ),
            titleSmall: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: Dimension.pt16,
            ),
            displayLarge: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 94,
            ),
            displayMedium: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 60,
            ),
            displaySmall: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 24,
            ),
            headlineLarge: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 48,
            ),
            headlineMedium: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 36,
            ),
            headlineSmall: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 20,
            ),
            bodyLarge: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 22,
            ),
            bodyMedium: const PoppinstTextStyle(
              newColor: CustomColors.white,
              fontDimension: 17,
            ),
            bodySmall: const PoppinstTextStyle(
              newColor: CustomColors.white,
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
}
