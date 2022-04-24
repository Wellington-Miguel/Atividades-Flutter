import 'package:exercise_navigator/aula_exercise_navigator/navigator_kay/rigth_pages/rigth_home_page.dart';
import 'package:exercise_navigator/aula_exercise_navigator/navigator_kay/rigth_pages/rigth_secund_page.dart';
import 'package:flutter/material.dart';

class LeftHomePage extends StatelessWidget {
  const LeftHomePage({Key? key, required this.leftPage}) : super(key: key);
  final GlobalKey<NavigatorState> leftPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[900],
          title: const Center(child: Text('Menu')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  final contex2 = leftPage.currentContext;
                  Navigator.of(contex2!).push(
                    MaterialPageRoute(
                        builder: (context) => const RightSecundPage()),
                  );
                },
                icon: const Icon(Icons.next_plan),
              ),
              IconButton(
                onPressed: () {
                  final contexTwo = leftPage.currentContext;
                  Navigator.of(contexTwo!).push(
                    MaterialPageRoute(builder: (_) => const RightHomePage()),
                  );
                },
                icon: const Icon(Icons.backspace_rounded),
              ),
            ],
          ),
        ));
  }
}
