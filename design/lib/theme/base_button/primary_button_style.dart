import 'package:design/theme/base_button/base_button_style.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class PrimaryButtonStyle extends BaseButtonStyle {
  PrimaryButtonStyle()
      : super(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return CustomColors.primaryUltraLightBlue;
              }
              if (states.contains(MaterialState.pressed)) {
                return CustomColors.primaryBlue.withOpacity(0.9);
              }
              return CustomColors
                  .primaryBlue; // Null to use the component's default.
            },
          ),
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return CustomColors.white;
              }
              if (states.contains(MaterialState.pressed)) {
                return CustomColors.white;
              }
              return CustomColors.white; // Null to use the component's default.
            },
          ),
        );
}
