import 'package:flutter/material.dart';

void main() => runApp(const MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
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
        child: Column(
          children: [
            CampodeTexto(
              label: 'Tarefa',
              hint: 'Digite sua nova tarefa',
              icone: Icons.playlist_add_check_sharp,
              imput: _novatarefa,
            ),
            CampodeTexto(
              label: 'Prazo',
              hint: 'Dia/mês/ano',
              icone: Icons.date_range_outlined,
              imput: _novadata,
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
                  CriarTarefa(context);
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
        ],
      ),
    );
  }

  void CriarTarefa(BuildContext context) {
    final String tarefa = _novatarefa.text;
    final String data = _novadata.text;
    final tarefarecebida = ReceberTarefa(
      tarefa.toString(),
      data.toString(),
    );
    Navigator.pop(context, tarefarecebida);
  }
}

class CampodeTexto extends StatelessWidget {
  const CampodeTexto({this.label, this.hint, this.icone, this.imput});
  final String? label;
  final String? hint;
  final IconData? icone;
  final TextEditingController? imput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            width: 2,
            color: Colors.green,
          ),
        ),
        elevation: 5,
        shadowColor: Colors.green[900],
        child: Container(
          padding: EdgeInsets.all(5),
          child: TextField(
            controller: imput,
            style: const TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
                icon: Icon(
                  icone,
                  color: Colors.green,
                  size: 30,
                ),
                labelStyle: TextStyle(color: Colors.black),
                hintText: hint,
                labelText: label),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

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
      shadowColor: Colors.green,
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          title: Text(
            _receberTarefa.tarefa,
            textDirection: TextDirection.ltr,
          ),
          subtitle: Text(
            _receberTarefa.data,
            textDirection: TextDirection.ltr,
          ),
          leading: const Icon(Icons.task),
          iconColor: Colors.green,
          trailing: const Icon(Icons.delete_forever),
        ),
      ),
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
