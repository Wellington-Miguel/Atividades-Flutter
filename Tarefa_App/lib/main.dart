import 'package:flutter/material.dart';
import 'ListaTarefa.dart';
import 'Home.dart';
import 'CampodeTexto.dart';
import 'ReceberTarefa.dart';

void main() => runApp(const MinhasTarefas());

class MinhasTarefas extends StatelessWidget {
  const MinhasTarefas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                  fixedSize: const Size(200, 50),
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
