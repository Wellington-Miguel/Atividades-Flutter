import 'package:flutter/material.dart';

class TabView extends StatelessWidget {
  const TabView({required this.tabController, Key? key}) : super(key: key);
  final TabController? tabController;
  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: tabController,
      indicatorSize: 10,
      color: Colors.white,
      selectedColor: Colors.amber[800],
    );
  }
}
