import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() => runApp(MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddTarefa(),
    );
  }
}

class AddTarefa extends StatelessWidget {
  AddTarefa({Key? key}) : super(key: key);
  final TextEditingController _novatarefa = TextEditingController();
  final TextEditingController _novadata = TextEditingController();
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
            Padding(
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
                  controller: _novatarefa,
                  style: const TextStyle(
                    fontSize: 20,
                    decorationColor: Colors.green,
                  ),
                  decoration: const InputDecoration(
                      iconColor: Colors.amberAccent,
                      icon: Icon(Icons.app_registration_rounded),
                      hintText: 'Digite sua nova tarefa',
                      labelText: 'Nova tarefa'),
                ),
              ),
            ),
            Padding(
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
                  controller: _novadata,
                  style: const TextStyle(
                    fontSize: 20,
                    decorationColor: Colors.green,
                  ),
                  decoration: const InputDecoration(
                      iconColor: Colors.amberAccent,
                      icon: Icon(Icons.app_registration_rounded),
                      hintText: 'Dara de entrega',
                      labelText: 'Dia/mês/ano'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton.icon(
                icon: Icon(
                  Icons.verified,
                  color: Colors.amber[50],
                ),
                style: ElevatedButton.styleFrom(
                  elevation: 20,
                  primary: Colors.teal[900],
                  onPrimary: Colors.green,
                  fixedSize: Size(200, 50),
                ),
                onPressed: () {
                  final String tarefa = _novatarefa.text;
                  final String data = _novadata.text;
                },
                label: Text(
                  'Confirmar',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.amber[50],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Adicionar tarefa',
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
      shadowColor: Colors.amber,
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
