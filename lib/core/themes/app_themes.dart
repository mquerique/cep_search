import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.light: _baseTheme(Brightness.light),
  AppTheme.dark: _baseTheme(Brightness.dark),
};

ThemeData _baseTheme(Brightness brightness) {
  final theme = ThemeData(brightness: brightness);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: const Color(0xFFFFDE58),
      secondary: const Color(0xFFFFDE58),
      onPrimary: Colors.black,
      onSecondary: Colors.black,
    ),
  );
}

enum AppTheme {
  light,
  dark,
}
