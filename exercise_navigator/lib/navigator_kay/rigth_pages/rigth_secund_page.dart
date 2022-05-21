import 'package:flutter/material.dart';

class RightSecundPage extends StatelessWidget {
  const RightSecundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Center(child: Text('Tela principal')),
      ),
      body: const Center(child: Text('Parabéns, interação feita com sucesso!')),
    );
  }
}
