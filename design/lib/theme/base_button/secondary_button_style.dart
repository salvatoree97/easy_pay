import 'package:design/theme/base_button/base_button_style.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class SecondaryButtonStyle extends BaseButtonStyle {
  SecondaryButtonStyle()
      : super(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return CustomColors.secondaryGray;
              }
              if (states.contains(MaterialState.pressed)) {
                return CustomColors.secondaryGray.withOpacity(0.9);
              }
              return CustomColors
                  .secondaryGray; // Null to use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return CustomColors.softBlack;
              }
              if (states.contains(MaterialState.pressed)) {
                return CustomColors.softBlack;
              }
              return CustomColors
                  .softBlack; // Null to use the component's default.
            },
          ),
        );
}
