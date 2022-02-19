import 'package:exercicio/exerciseCalculadora/theme.dart';
import 'package:flutter/material.dart';
import 'home.dart';

class Caculator extends StatefulWidget {
  const Caculator({Key? key}) : super(key: key);

  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  bool themeControll = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.blue[200],
      title: "Calculator",
      debugShowCheckedModeBanner: false,
      theme: themeControll ? Themecalculator.light : Themecalculator.dark,
      themeMode: ThemeMode.system,
      home: Home(
        thememode: themeControll,
        onpresstheme: (bool value) {
          setState(() {
            themeControll = value;
          });
        },
      ),
    );
  }
}
