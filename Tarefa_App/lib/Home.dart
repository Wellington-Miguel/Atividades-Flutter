import 'package:flutter/material.dart';
import 'ListaTarefa.dart';
import 'ReceberTarefa.dart';
import 'AddTarefa.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ReceberTarefa> _tarefas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: _tarefas.length,
          itemBuilder: (context, index) {
            final tarefa = _tarefas[index];
            return ListaTarefa(tarefa);
          }),
      appBar: AppBar(
        title: const Text(
          'Minhas tarefas',
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: Colors.lightGreen[800],
        centerTitle: true,
        foregroundColor: Colors.amber[50],
        actions: const [
          Icon(Icons.search),
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        ],
      ),
      floatingActionButton: Stack(children: [
        Positioned(
          child: FloatingActionButton.extended(
            onPressed: () {
              final Future<ReceberTarefa?> future = Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return AddTarefa();
                }),
              ).then((tarefas) {
                setState(() {
                  _tarefas.add(tarefas);
                });
                return null;
              });
            },
            splashColor: Colors.amber[50],
            icon: const Icon(Icons.add),
            backgroundColor: Colors.green[900],
            foregroundColor: Colors.amber[50],
            label: const Text(
              'Nova tarefa',
              style: TextStyle(fontSize: 20, fontFamily: 'Droid Sans Fallback'),
            ),
          ),
          bottom: 70,
          right: 10,
        ),
      ]),
    );
  }
}
