import 'package:exercise_navigator/page_view/rigth_pages/rigth_home_pageview.dart';
import 'package:exercise_navigator/page_view/rigth_pages/rigth_second_page.dart';
import 'package:flutter/material.dart';

class RightPageView extends StatelessWidget {
  const RightPageView({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Tela principal')),
          backgroundColor: Colors.green[400],
        ),
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [RigthHomePage(), RightSecondPage()],
        ));
  }
}
