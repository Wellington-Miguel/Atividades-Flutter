import 'package:flutter/material.dart';

int easterEgg = 0;
void ShowEasterEgg(int value, BuildContext context) {
  easterEgg += value;
  if (easterEgg >= 2) {
    easterEgg = 0;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Clique em um número para começar'),
    ));
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
        title: const Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  ShowEasterEgg(1, context);
                },
                child: const Card(
                  elevation: 5,
                  margin: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text('Visor'),
                  ),
                ),
              )),
          const Expanded(child: Text('linha')),
          const Expanded(child: Text('linha')),
          const Expanded(child: Text('linha')),
          const Expanded(child: Text('linha')),
        ],
      ),
    );
  }
}
