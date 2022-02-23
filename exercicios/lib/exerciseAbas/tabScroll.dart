import 'package:flutter/material.dart';

class TabScroll extends StatefulWidget {
  const TabScroll({Key? key}) : super(key: key);

  @override
  _TabScrollState createState() => _TabScrollState();
}

class _TabScrollState extends State<TabScroll> {
  final tabs = const [
    Tab(text: 'Tab 1'),
    Tab(text: 'Tab 2'),
    Tab(text: 'Tab 4'),
    Tab(text: 'Tab 5'),
    Tab(text: 'Tab 6'),
    Tab(text: 'Tab 7'),
    Tab(text: 'Tab 8'),
    Tab(text: 'Tab 9'),
  ];
  final tabBar = [
    const Center(child: Text('Tab 1')),
    const Center(child: Text('Tab 2')),
    const Center(child: Text('Tab 3')),
    const Center(child: Text('Tab 4')),
    const Center(child: Text('Tab 5')),
    const Center(child: Text('Tab 6')),
    const Center(child: Text('Tab 7')),
    const Center(child: Text('Tab 8')),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet-commerce',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Align(
              child: Text('TabScroll'),
              alignment: Alignment.center,
            ),
            backgroundColor: Colors.red[400],
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.red,
              tabs: tabs,
            ),
          ),
          body: Center(
            child: TabBarView(
              children: tabBar,
            ),
          ),
        ),
      ),
    );
  }
}
