import 'package:exercicio/exercise_state_management/app_task/bloc/taskBloc.dart';
import 'package:exercicio/exercise_state_management/app_task/bloc/taskEvent.dart';
import 'package:exercicio/exercise_state_management/app_task/componets/inputBottomSheet.dart';
import 'package:exercicio/exercise_state_management/app_task/model/task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBottomSheet extends StatefulWidget {
  const CardBottomSheet({Key? key}) : super(key: key);

  @override
  State<CardBottomSheet> createState() => _CardBottomSheetState();
}

class _CardBottomSheetState extends State<CardBottomSheet> {
  TextEditingController title = TextEditingController(text: '');

  TextEditingController task = TextEditingController(text: '');

  TextEditingController date = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 361,
      width: 425,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Adicione uma tarefa',
              style: GoogleFonts.actor(fontSize: 20),
            ),
          ),
          InputBottomSheet(
            label: 'Título',
            controller: title,
          ),
          InputBottomSheet(
            controller: task,
            label: 'Tarefa',
          ),
          InputBottomSheet(
            controller: date,
            label: 'Data',
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<TaskBloc>(context).add(
                  AddTask(
                    task: Task(
                      title: title.text,
                      objective: task.text,
                      deadline: date.text,
                    ),
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text('Adicionar'))
        ],
      ),
    );
  }

  @override
  void dispose() {
    title.dispose();
    task.dispose();
    date.dispose();
    super.dispose();
  }
}
