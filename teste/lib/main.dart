import 'package:flutter/material.dart';

void main() => runApp(MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Tarefas(),

      // backgroundColor: Colors.lime[300],
    );
  }
}

class Tarefas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lime, Colors.lightGreenAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: Column(
          children: [
            ListaTarefa(ReceberTarefa('Correr 100 Km', 'Em uma semana')),
            ListaTarefa(
              ReceberTarefa('Finalizar TCC', 'Em um mês'),
            )
          ],
        ),
      ),
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 30)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        splashColor: Colors.blue,
        icon: const Icon(Icons.add),
        backgroundColor: Colors.lightGreen[800],
        foregroundColor: Colors.amber[50],
        label: const Text(
          'Nova tarefa',
          style: TextStyle(fontSize: 20, fontFamily: 'Droid Sans Fallback'),
        ),
      ),
    );
  }
}

class ReceberTarefa {
  String tarefa;
  String data;
  ReceberTarefa(this.tarefa, this.data);
}

class ListaTarefa extends StatelessWidget {
  final ReceberTarefa _receberTarefa;
  ListaTarefa(this._receberTarefa);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_receberTarefa.tarefa),
        subtitle: Text(_receberTarefa.data),
        leading: Icon(Icons.task),
      ),
      color: Colors.amber[50],
    );
  }
}
