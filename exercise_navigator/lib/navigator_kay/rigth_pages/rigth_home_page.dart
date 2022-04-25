import 'package:flutter/material.dart';

class RightHomePage extends StatelessWidget {
  const RightHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext contextTwo) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Tela principal')),
        backgroundColor: Colors.green[400],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Interaja com o ambiente ao lado'),
            Icon(
              Icons.turn_left_rounded,
              color: Colors.green[900],
            )
          ],
        ),
      ),
    );
  }
}
