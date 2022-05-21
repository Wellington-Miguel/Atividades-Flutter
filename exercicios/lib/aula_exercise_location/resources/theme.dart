import 'package:flutter/material.dart';

class WonderfulCitiesTheme {
  static final light = ThemeData(
    colorScheme: ColorScheme.light(
      primary: const Color(0xFFF8BBD0),
      primaryContainer: const Color(0xFFC48B9F),
      onPrimary: Colors.black.withOpacity(0.75),
      secondary: const Color(0xFFB3E5FC),
      secondaryContainer: const Color(0xFF82B3C9),
    ),
    scaffoldBackgroundColor: const Color(0xFFDCDCDD),
  );

  static final dark = ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color(0xFFC48B9F),
      secondary: Color(0xFF82B3C9),
    ),
  );
}
