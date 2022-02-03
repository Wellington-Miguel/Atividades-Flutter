import 'package:flutter/material.dart';

void main() => runApp(MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AddTarefa(),
    );
  }
}

class AddTarefa extends StatelessWidget {
  const AddTarefa({Key? key}) : super(key: key);

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
            ImputTarefa(
              'Nova Tarefa',
              'Digite sua nova tarefa...',
              Icon(Icons.app_registration_rounded),
            ),
            ImputTarefa(
              'Data de entrega',
              'dia/mês/ano',
              Icon(Icons.date_range),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Adicionar nova tarefa',
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
    );
  }
}

class ImputTarefa extends StatelessWidget {
  ImputTarefa(this.tite, this.subtite, this.icon, {Key? key}) : super(key: key);
  String tite;
  String subtite;
  Icon icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            width: 3,
            color: Colors.green,
          ),
        ),
        elevation: 10,
        shadowColor: Colors.amber,
        child: TextField(
          style: const TextStyle(
            fontSize: 20,
            decorationColor: Colors.green,
          ),
          decoration: InputDecoration(
              iconColor: Colors.amberAccent,
              icon: icon,
              hintText: subtite,
              labelText: tite),
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
            ),
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
      floatingActionButton: Stack(children: [
        Positioned(
          child: FloatingActionButton.extended(
            autofocus: true,
            onPressed: () {},
            splashColor: Colors.amber[50],
            icon: const Icon(Icons.add),
            backgroundColor: Colors.lightGreen[800],
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
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(_receberTarefa.tarefa),
          subtitle: Text(_receberTarefa.data),
          leading: const Icon(Icons.task),
          iconColor: Colors.green,
          trailing: const Icon(Icons.delete_forever),
        ),
      ),
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
