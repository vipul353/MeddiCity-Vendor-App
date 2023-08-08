import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  fontFamily: 'Roboto',
  primaryColor: Color(0xFF5733d5),
  secondaryHeaderColor: Color(0xFF2bc1a4),
  disabledColor: Color(0xFFA0A4A8),
  errorColor: Color(0xFFE84D4F),
  brightness: Brightness.light,
  hintColor: Color(0xFF9F9F9F),
  cardColor: Colors.white,
  colorScheme: ColorScheme.light(primary: Color(0xFF5733d5), secondary: Color(0xFF5733d5)),
  textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(foregroundColor: Color(0xFF5733d5))),
);