import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CardTask extends StatelessWidget {
  CardTask(
      {required this.title, required this.task, required this.date, Key? key})
      : super(key: key);
  String title;
  String task;
  String date;
  MaskTextInputFormatter deadline = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        height: 160,
        width: 368,
        child: Align(
          alignment: Alignment.topCenter,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close))
                    ],
                  ),
                  Text(task, style: GoogleFonts.lato(fontSize: 16)),
                  Row(
                    children: [
                      const Icon(Icons.timer_rounded),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(deadline.maskText(date)),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
