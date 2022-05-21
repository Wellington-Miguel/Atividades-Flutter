import 'package:flutter/material.dart';

class LeftHomePage extends StatelessWidget {
  const LeftHomePage({Key? key, required this.pageController})
      : super(key: key);
  final PageController pageController;
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
                  pageController.jumpToPage(1);
                },
                icon: const Icon(Icons.next_plan),
              ),
              IconButton(
                onPressed: () {
                  pageController.jumpToPage(0);
                },
                icon: const Icon(Icons.backspace_rounded),
              ),
            ],
          ),
        ));
  }
}
