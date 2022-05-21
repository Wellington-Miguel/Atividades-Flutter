import 'package:exercise_navigator/routes_navigator/pages/home_page.dart';
import 'package:exercise_navigator/routes_navigator/pages/seconde_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Routes Named',
    initialRoute: '/',
    onGenerateRoute: (settingRoutes) {
      if (settingRoutes.name == '/second') {
        final message = settingRoutes.arguments.toString();
        return MaterialPageRoute(
            builder: (context) => SecondPage(
                  message: message,
                ));
      }
      return null;
    },
    routes: {
      '/': (context) => const HomePage(),
    },
  ));
}
