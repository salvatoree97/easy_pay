import 'package:design/theme/base_button/primary_button_style.dart';
import 'package:design/theme/base_button/secondary_button_style.dart';
import 'package:design/theme/base_button/text_button_style.dart';
import 'package:flutter/material.dart';

///CustomButtonTheme
///
///All of the button themes used in the application
class CustomButtonTheme {
  static final textButtonTheme = TextButtonThemeData(style: TextButtonStyle());

  static final primaryElevatedButtonTheme =
      ElevatedButtonThemeData(style: PrimaryButtonStyle());

  static final secondaryElavatedButtonTheme =
      ElevatedButtonThemeData(style: SecondaryButtonStyle());
}
