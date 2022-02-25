import 'package:flutter/material.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AppBarIcon',
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Coffee',
            style: TextStyle(color: Colors.brown),
          ),
          backgroundColor: Colors.amber[50],
          leading: const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Icon(
              Icons.coffee,
              color: Colors.brown,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}
