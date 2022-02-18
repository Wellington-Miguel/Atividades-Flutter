import 'package:flutter/material.dart';

class tabFixa extends StatefulWidget {
  const tabFixa({Key? key}) : super(key: key);

  @override
  _tabFixaState createState() => _tabFixaState();
}

class _tabFixaState extends State<tabFixa> {
  final tabs = [
    const Tab(text: 'Cachorros'),
    const Tab(text: 'Gatos'),
    const Tab(text: 'Pássaros')
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
            title: const Text('Pet-commerce'),
            leading: const Icon(
              Icons.pets,
              color: Colors.red,
            ),
            backgroundColor: Colors.indigo[400],
            bottom: TabBar(
              indicatorColor: Colors.red,
              tabs: tabs,
            ),
          ),
        ),
      ),
    );
  }
}
