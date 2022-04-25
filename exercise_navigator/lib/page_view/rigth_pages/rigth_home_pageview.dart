import 'package:flutter/material.dart';

class RigthHomePage extends StatelessWidget {
  const RigthHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
