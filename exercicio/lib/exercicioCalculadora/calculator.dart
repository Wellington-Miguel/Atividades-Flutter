import 'package:exercicio/exercicioCalculadora/theme.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class Caculator extends StatelessWidget {
  const Caculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue[200],
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: Themecalculator.light,
      themeMode: ThemeMode.light,
      home: const Home(),
    );
  }
}
