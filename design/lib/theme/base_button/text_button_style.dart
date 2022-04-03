import 'package:design/theme/base_button/base_button_style.dart';
import 'package:design/theme/color/custom_colors.dart';
import 'package:flutter/material.dart';

class TextButtonStyle extends BaseButtonStyle {
  TextButtonStyle({
    TextStyle? textStyle,
  }) : super.withTextStyle(
          backgroundColor: null,
          foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return CustomColors.grey;
              }
              return CustomColors
                  .primaryDarkBlue; // Null to use the component's default.
            },
          ),
          textStyle: textStyle,
        );
}
