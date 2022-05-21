import 'package:flutter/material.dart';

class LeftHomePage extends StatelessWidget {
  const LeftHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tela principal')),
        backgroundColor: Colors.green[400],
      ),
      body: const Center(
        child: Text('Interaja com o ambiente ao lado =>'),
      ),
    );
  }
}
