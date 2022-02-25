import 'package:flutter/material.dart';

class DarkMode extends StatefulWidget {
  const DarkMode({Key? key}) : super(key: key);

  @override
  _DarkModeState createState() => _DarkModeState();
}

class _DarkModeState extends State<DarkMode> {
  bool switch_buttom = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: switch_buttom ? ThemeApp.light : ThemeApp.dark,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              switch_buttom
                  ? ThemeApp.light.primaryColor
                  : ThemeApp.dark.primaryColor,
              switch_buttom
                  ? ThemeApp.light.shadowColor
                  : ThemeApp.dark.shadowColor
            ])),
        child: Column(
          children: [
            const BannerTop(),
            GridButtom(switch_buttom),
            ThemeButtom(switch_buttom, (bool value) {
              setState(() {
                switch_buttom = value;
              });
            })
          ],
        ),
      )),
    );
  }
}

class GridButtom extends StatelessWidget {
  GridButtom(
    this.theme, {
    Key? key,
  }) : super(key: key);
  bool theme;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
        child: GridView.count(
          childAspectRatio: 1.4,
          crossAxisCount: 2,
          children: [
            ButtomHome('Luzes', Icons.lightbulb_outline, theme),
            ButtomHome('Temperatura', Icons.thermostat, theme),
            ButtomHome('Lavadora', Icons.waves, theme),
            ButtomHome('Segurança', Icons.security, theme),
            ButtomHome('Wifi', Icons.wifi_rounded, theme),
            ButtomHome('Televisão', Icons.tv, theme),
          ],
        ),
      ),
    );
  }
}

class ButtomHome extends StatelessWidget {
  ButtomHome(
    this.name,
    this.icon,
    this.theme, {
    Key? key,
  }) : super(key: key);
  String name;
  IconData icon;
  bool theme;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(
            icon,
            size: 40,
            color: theme ? Colors.blue[900] : Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: theme ? Colors.blue[900] : Colors.white,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class BannerTop extends StatelessWidget {
  const BannerTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.home_outlined,
            size: 100,
          ),
          Column(
            children: const [
              Text(
                'SWEET HOME',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Text('O que gostaria de monitorar?',
                  style: TextStyle(fontSize: 15)),
            ],
          ),
        ],
      ),
    );
  }
}

class ThemeButtom extends StatefulWidget {
  ThemeButtom(this.switch_buttom, this.Theme_mode, {Key? key})
      : super(key: key);
  bool switch_buttom;
  Function(bool) Theme_mode;
  @override
  State<ThemeButtom> createState() => _ThemeButtomState();
}

class _ThemeButtomState extends State<ThemeButtom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 30, 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              widget.switch_buttom ? 'Theme Light' : 'Theme Dark',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Transform.scale(
            scale: 1.5,
            child: Switch.adaptive(
                value: widget.switch_buttom,
                onChanged: (bool value) {
                  widget.switch_buttom = value;
                  setState(() {
                    widget.Theme_mode(value);
                  });
                }),
          )
        ],
      ),
    );
  }
}

class ThemeApp {
  static final ThemeData light = ThemeData(
      brightness: Brightness.light,
      primaryColor: Colors.grey[50],
      shadowColor: Colors.grey[300],
      primarySwatch: Colors.grey,
      scaffoldBackgroundColor: Colors.blueGrey[100],
      textTheme: TextTheme(
        headline1: TextStyle(color: Colors.blue[900]),
        bodyText2: TextStyle(color: Colors.blue[900]),
        button: TextStyle(
          color: Colors.blue[900],
        ),
      ),
      iconTheme: IconThemeData(color: Colors.blue[900]));
  static final ThemeData dark = ThemeData(
    primaryColor: Colors.indigo[900],
    shadowColor: Colors.grey[900],
    brightness: Brightness.dark,
    primarySwatch: Colors.indigo,
    scaffoldBackgroundColor: Colors.blueGrey[900],
  );
}
