import 'package:flutter/material.dart';

class TryCache extends StatefulWidget {
  const TryCache({Key? key}) : super(key: key);

  @override
  State<TryCache> createState() => _TryCacheState();
}

class _TryCacheState extends State<TryCache> {
  final firstNumber = TextEditingController();
  final lastNumber = TextEditingController();
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
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              controller: lastNumber,
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Calcular'),
          )
        ],
      ),
    );
  }
}
