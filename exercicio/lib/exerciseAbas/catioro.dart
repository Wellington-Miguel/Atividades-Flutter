import 'package:flutter/material.dart';

class Catioro extends StatefulWidget {
  const Catioro({Key? key}) : super(key: key);

  @override
  _CatioroState createState() => _CatioroState();
}

class _CatioroState extends State<Catioro> {
  final tabs = const [
    'Golden',
    'Dalmata',
    'Weimaraner',
    'Beagle',
    'Border Colli',
    'Husky',
    'Spaniel',
    'Dachshund',
  ];
  final tabBar = [
    'assets/golden.png',
    'assets/dalmata.jpg',
    'assets/Weimaraner.jpg',
    'assets/Beagle.jpg',
    'assets/border_collie.jpg',
    'assets/husky.jpg',
    'assets/spaniel.jpg',
    'assets/Dachshund.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cachorros',
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: const Align(
              child: Text('Cachorros Tab'),
              alignment: Alignment.center,
            ),
            backgroundColor: Colors.red[400],
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                for (final tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
          ),
          body: Center(
            child: TabBarView(
              children: [
                for (final tabar in tabBar)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                    child: ClipOval(
                      child: Image.asset(
                        tabar,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
