import 'package:flutter/material.dart';

class ThemeModeProvider with ChangeNotifier {
  ThemeModeProvider._();
  static final ThemeModeProvider instance = ThemeModeProvider._();

  bool _isDarkTheme = true;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
}
