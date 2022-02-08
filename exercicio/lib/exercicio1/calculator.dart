import 'package:exercicio/exercicio1/theme.dart';
import 'package:flutter/material.dart';

import 'home.dart';

class caculator extends StatelessWidget {
  const caculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue[200],
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: themecalculator.light,
      themeMode: ThemeMode.light,
      home: home(),
    );
  }
}
