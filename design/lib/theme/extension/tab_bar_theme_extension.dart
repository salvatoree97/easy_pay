import 'package:design/design.dart';
import 'package:design/theme/text_style/poppins_text_style.dart';
import 'package:flutter/material.dart';

extension TabBarThemeExtension on Themes {
  static const TabBarTheme lightTabBarTheme = TabBarTheme(
    labelColor: CustomColors.primaryDarkBlue,
    unselectedLabelColor: CustomColors.primaryUltraLightBlue,
    labelStyle: PoppinstTextStyle.withBold(
      fontDimension: Dimension.pt15,
      newColor: CustomColors.primaryDarkBlue,
    ),
    unselectedLabelStyle: PoppinstTextStyle.withRegular(
        fontDimension: Dimension.pt15,
        newColor: CustomColors.primaryUltraLightBlue),
  );

  static const TabBarTheme darkTabBarTheme = TabBarTheme(
    labelColor: CustomColors.white,
    unselectedLabelColor: CustomColors.secondaryGray,
    labelStyle: PoppinstTextStyle.withBold(fontDimension: Dimension.pt15),
    unselectedLabelStyle: PoppinstTextStyle(fontDimension: Dimension.pt15),
  );
}
