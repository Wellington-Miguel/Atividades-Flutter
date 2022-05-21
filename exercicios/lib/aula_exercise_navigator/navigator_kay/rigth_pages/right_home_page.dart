import 'package:exercicio/aula_exercise_navigator/navigator_kay/rigth_pages/rigth_secund_page.dart';
import 'package:flutter/material.dart';

class RightHomePage extends StatelessWidget {
  const RightHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[900],
        title: const Center(child: Text('Menu')),
      ),
      body: ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const RightSecundPage()));
          },
          child: const Text('Próxima página')),
    );
  }
}
