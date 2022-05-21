import 'package:exercise_navigator/page_view/left_pages/left_home_page.dart';
import 'package:exercise_navigator/page_view/rigth_pages/rigth_page_view.dart';
import 'package:flutter/material.dart';

class MainPageView extends StatelessWidget {
  MainPageView({Key? key}) : super(key: key);
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Double interfaces with PageView',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[850],
      ),
      body: Row(
        children: [
          SizedBox(
            width: 100,
            child: Navigator(
              onGenerateRoute: (settings) {
                return PageRouteBuilder(
                    pageBuilder: (_, __, ___) => LeftHomePage(
                          pageController: pageController,
                        ));
              },
            ),
          ),
          Expanded(
            child: Navigator(
              onGenerateRoute: (settings) {
                return PageRouteBuilder(pageBuilder: (context2, __, ___) {
                  return RightPageView(
                    pageController: pageController,
                  );
                });
              },
            ),
          )
        ],
      ),
    );
  }
}
