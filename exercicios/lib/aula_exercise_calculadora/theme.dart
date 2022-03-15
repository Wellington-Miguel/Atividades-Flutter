import 'package:flutter/material.dart';

class Themecalculator {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.white,
  );
  static final ThemeData dark = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: Colors.indigo,
      scaffoldBackgroundColor: Colors.grey[900],
      bottomAppBarColor: Colors.grey[900]);
}
