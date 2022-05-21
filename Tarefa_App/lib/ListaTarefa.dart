import 'package:flutter/material.dart';
import 'ReceberTarefa.dart';

class ListaTarefa extends StatelessWidget {
  final ReceberTarefa _receberTarefa;

  const ListaTarefa(this._receberTarefa, {Key? key}) : super(key: key);
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
