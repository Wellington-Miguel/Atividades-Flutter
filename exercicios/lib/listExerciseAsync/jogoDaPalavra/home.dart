import 'dart:math';

import 'package:exercicio/listExerciseAsync/jogoDaPalavra/words.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final selectWord = Random();
  final wordController = TextEditingController();
  bool startGame = false;
  int pontos = 0;
  int time = 15;
  String wordPass = '';

  Future<void> countdown() async {
    for (int i = time; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        time = i;
        if (i == 0) {
          startGame = false;
          time = 15;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title:
            Center(child: Text(startGame ? '00:$time' : 'Jogo das palavras')),
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: wordController,
              decoration: const InputDecoration(
                isDense: true,
                labelText: 'Digite uma palavra',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: startGame
                ? (() {
                    final word = wordsList[3];
                    wordPass = wordController.text;
                    debugPrint(wordPass);
                    debugPrint(word);
                    setState(() {
                      if (wordPass == word) {
                        startGame = false;
                        pontos += 1;
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const AlertDialog(
                              title: Center(
                                  child: Text(
                                'Você errou',
                              )),
                            );
                          },
                        );
                      }
                    });
                  })
                : null,
            child: const Text('Enviar palavra'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              onPressed: startGame
                  ? null
                  : (() {
                      setState(() {
                        startGame = true;
                        countdown();
                      });
                    }),
              child: const Text('Start game'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Container(
              height: 20,
              width: 60,
              color: Colors.green,
              child: Text(
                pontos.toString(),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      )),
    );
  }
}
