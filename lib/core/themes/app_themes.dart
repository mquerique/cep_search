import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.light: _baseTheme(Brightness.light).copyWith(),
  AppTheme.dark: _baseTheme(Brightness.dark).copyWith(),
};

ThemeData _baseTheme(Brightness brightness) {
  final theme = ThemeData(brightness: brightness);
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: const Color(0xFFFFDE58),
      secondary: const Color(0xFFFFDE58),
      onSecondary: Colors.white,
      onPrimary: Colors.white,
    ),
  );
}

enum AppTheme {
  light,
  dark,
}
