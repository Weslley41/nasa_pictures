import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class DesignProvider with ChangeNotifier {
  late bool _isDark;

  DesignProvider() {
    final Brightness brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
    _isDark = brightness == Brightness.dark;
  }

  bool get isDark => _isDark;
  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;

  dynamic changeThemeMode() {
    _isDark = !_isDark;
    notifyListeners();
  }
}
