// ignore_for_file: file_names

import 'package:flutter/material.dart';

class CustomTheme {
  static bool usingDark = true;

  static final ThemeData lightTheme = ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF4A0229));

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xFF3E0422),
  );
}
