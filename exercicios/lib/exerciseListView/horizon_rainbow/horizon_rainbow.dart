import 'package:flutter/material.dart';

class HorizonRainbow extends StatefulWidget {
  const HorizonRainbow({Key? key}) : super(key: key);

  @override
  _HorizonRainbowState createState() => _HorizonRainbowState();
}

class _HorizonRainbowState extends State<HorizonRainbow> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[50],
          title: Text(
            'VLAVAAV Horizontal',
            style: TextStyle(color: Colors.grey[900]),
          ),
        ),
        body: GridView.count(
          childAspectRatio: 0.09,
          crossAxisCount: 7,
          scrollDirection: Axis.vertical,
          children: [
            Faixas(Colors.red, 'Red'),
            Faixas(Colors.orange, 'Orange'),
            Faixas(Colors.yellow, 'Yellow'),
            Faixas(Colors.green, 'Green'),
            Faixas(Colors.blue, 'Blue'),
            Faixas(Colors.indigo, 'Indigo'),
            Faixas(Colors.deepPurple, 'Purple'),
          ],
        ),
      ),
    );
  }
}

class Faixas extends StatelessWidget {
  Faixas(
    this.cor,
    this.name, {
    Key? key,
  }) : super(key: key);
  Color cor;
  String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: cor,
      child: Center(
        child: RotatedBox(
          quarterTurns: 3,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
