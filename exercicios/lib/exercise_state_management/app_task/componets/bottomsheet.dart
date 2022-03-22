import 'package:exercicio/exercise_state_management/app_task/componets/inputBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBottomSheet extends StatelessWidget {
  const CardBottomSheet({Key? key}) : super(key: key);

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
          ),
          InputBottomSheet(
            label: 'Tarefa',
          ),
          InputBottomSheet(
            label: 'Data',
          ),
          ElevatedButton(onPressed: () {}, child: const Text('Adicionar'))
        ],
      ),
    );
  }
}
