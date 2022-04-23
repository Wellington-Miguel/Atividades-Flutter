import 'package:exercicio/aula_exercise_navigator/navigator_kay/left_pages/left_home_page.dart';
import 'package:exercicio/aula_exercise_navigator/navigator_kay/rigth_pages/right_home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> _leftPage = GlobalKey();
  final GlobalKey<NavigatorState> _rigthPage = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Double interfaces',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: Navigator(
              key: _leftPage,
              onGenerateRoute: (settings) {
                return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const LeftHomePage());
              },
            ),
          ),
          Expanded(
            child: Navigator(
              key: _rigthPage,
              onGenerateRoute: (settings) {
                return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => const RightHomePage());
              },
            ),
          )
        ],
      ),
    );
  }
}
