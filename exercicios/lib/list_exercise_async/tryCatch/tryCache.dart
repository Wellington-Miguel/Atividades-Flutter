import 'package:flutter/material.dart';

class TryCache extends StatefulWidget {
  const TryCache({Key? key}) : super(key: key);

  @override
  State<TryCache> createState() => _TryCacheState();
}

class _TryCacheState extends State<TryCache> {
  final firstNumber = TextEditingController();
  final lastNumber = TextEditingController();
  int valueOne = 0;
  int valueTwo = 0;
  int result = 0;
  FocusNode focusOne = FocusNode();
  FocusNode focusTwo = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Try Cache'),
        ),
        backgroundColor: Colors.indigo[300],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(30),
            child: Text('Digite dois números para serem somados'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: TextFormField(
              focusNode: focusOne,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: firstNumber,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: TextFormField(
              focusNode: focusTwo,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: lastNumber,
            ),
          ),
          MaterialButton(
            color: Theme.of(context).primaryColor,
            onPressed: calcular,
            child: const Text(
              'Calcular',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void calcular() {
    try {
      valueOne = int.parse(firstNumber.text);
      debugPrint(valueOne.toString());
    } catch (e) {
      menssagem("Digite um número");
      FocusScope.of(context).requestFocus(focusOne);
      return;
    }
    try {
      valueTwo = int.parse(lastNumber.text);
      debugPrint(valueTwo.toString());
    } catch (e) {
      menssagem("Digite um número");
      FocusScope.of(context).requestFocus(focusTwo);
      return;
    }
    result = valueOne + valueTwo;
    menssagem('A soma dos números é $result');
    firstNumber.text = '';
    lastNumber.text = '';
  }

  void menssagem(String erro) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(erro),
          );
        });
  }
}
