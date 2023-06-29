import 'package:flutter/material.dart';

final Color _appColor = Colors.blue.shade800;

final ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _appColor, brightness: Brightness.light
  ),
);

final ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: _appColor, brightness: Brightness.dark
  ),
);
