import 'package:flutter/material.dart';

class ThemeTask {
  static final taskThemeLigth = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.purple,
      primaryColor: Colors.purple[600],
      cardColor: Colors.purple[50],
      iconTheme: IconThemeData(color: Colors.deepPurple[400]));

  static final taskThemeDark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    primaryColor: Colors.purple[900],
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.purple[900],
    ),
  );
}
