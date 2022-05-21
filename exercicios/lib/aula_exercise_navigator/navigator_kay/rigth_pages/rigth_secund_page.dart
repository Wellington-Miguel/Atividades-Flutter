import 'package:exercicio/aula_exercise_navigator/navigator_kay/rigth_pages/right_home_page.dart';
import 'package:flutter/material.dart';

class RightSecundPage extends StatelessWidget {
  const RightSecundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Center(child: Text('Menu')),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const RightHomePage()));
          },
          child: const Text('Página anterior')),
    );
  }
}
