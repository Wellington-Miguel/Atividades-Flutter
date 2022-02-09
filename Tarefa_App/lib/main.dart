import 'package:flutter/material.dart';
import 'Home.dart';

void main() => runApp(const MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
