import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardTask extends StatelessWidget {
  const CardTask({Key? key}) : super(key: key);

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
                        'Title',
                        style: GoogleFonts.lato(fontSize: 20),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.close))
                    ],
                  ),
                  Text('Tarefa', style: GoogleFonts.lato(fontSize: 16)),
                  Row(
                    children: const [
                      Icon(Icons.timer_rounded),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text('data'),
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
