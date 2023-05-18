import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: const Color(0xFFFE3C58),
    primaryColorDark: const Color(0xFFFC0028),
    primaryColorLight: const Color(0xFFFE9AAA),
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      background: const Color(0xFFF5F5F5),
    ),
    fontFamily: 'Futuna',
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.w500,
        ),
        displaySmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
        ),
        headlineLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
        ),
        headlineMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.w500,
        ),
        headlineSmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
        ),
        titleLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
        ),
        titleMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.w500,
        ),
        titleSmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
        ),
        labelLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
        ),
        labelMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.w500,
        ),
        labelSmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
        ),
        bodyLarge: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.w500,
        ),
        bodySmall: TextStyle(
          color: Color(0xFF1B070B),
          fontWeight: FontWeight.normal,
        )),
  );
}
