import 'package:exercise_navigator/navigator_kay/left_pages/left_home_page.dart';
import 'package:exercise_navigator/navigator_kay/rigth_pages/rigth_home_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> _leftPage = GlobalKey();
  final GlobalKey<NavigatorState> _rigthPage = GlobalKey();
  late BuildContext contextTwo;
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
                    pageBuilder: (_, __, ___) => LeftHomePage(
                          leftPage: _rigthPage,
                        ));
              },
            ),
          ),
          Expanded(
            child: Navigator(
              key: _rigthPage,
              onGenerateRoute: (settings) {
                return PageRouteBuilder(pageBuilder: (context2, __, ___) {
                  contextTwo = context2;
                  return const RightHomePage();
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
