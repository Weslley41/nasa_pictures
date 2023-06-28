import 'package:flutter/material.dart';

class DesignProvider with ChangeNotifier {
  ThemeMode _theme = ThemeMode.light;
  bool _isdark = false;

  bool get isDark => _isdark;
  ThemeMode get themeMode => _theme;

  dynamic changeThemeMode(newValue) {
    _isdark = newValue;
    if (_theme == ThemeMode.light) {
      _theme = ThemeMode.dark;
    } else {
      _theme = ThemeMode.light;
    }
    notifyListeners();
  }
}
