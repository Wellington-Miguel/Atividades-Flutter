import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeApp.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.home_outlined,
                    size: 100,
                  ),
                ),
                Column(
                  children: const [
                    Text(
                      'SWEET HOME',
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Text('O que gostaria de monitorar?',
                        style: TextStyle(fontSize: 20)),
                  ],
                )
              ],
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            children: [
              for (int i = 0; i < 6; i++)
                const Card(
                  child: Text('Card'),
                )
            ],
          )
        ],
      )),
    );
  }
}

class ThemeApp {
  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primarySwatch: Colors.blueGrey,
      scaffoldBackgroundColor: Colors.blueGrey[100],
      textTheme: TextTheme(
        bodyText2: TextStyle(color: Colors.blue[900]),
      ),
      iconTheme: IconThemeData(color: Colors.blue[900]));
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.blueGrey[900],
  );
}
