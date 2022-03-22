import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardBottomSheet extends StatelessWidget {
  const CardBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 261,
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
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                label: Text('Título'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                isDense: true,
                label: Text('Tarefa'),
              ),
            ),
          )
        ],
      ),
    );
  }
}
