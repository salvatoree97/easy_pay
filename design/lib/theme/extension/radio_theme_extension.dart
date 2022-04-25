import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class RadioThemeExtension {
  static final lightRadioTheme = RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) CustomColors.primaryBlue;
      return CustomColors.primaryBlue; // Null to use the component's default.
    }),
  );

  static final RadioThemeData darkRadioTheme = RadioThemeData(
    fillColor:
        MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
      if (states.contains(MaterialState.focused)) CustomColors.primaryBlue;
      return CustomColors.primaryBlue; // Null to use the component's default.
    }),
  );
}
