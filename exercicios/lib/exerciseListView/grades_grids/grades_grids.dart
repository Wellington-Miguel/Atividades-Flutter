import 'package:flutter/material.dart';

class GradesGrids extends StatefulWidget {
  const GradesGrids({Key? key}) : super(key: key);

  @override
  _GradesGridsState createState() => _GradesGridsState();
}

class _GradesGridsState extends State<GradesGrids> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              Testa(),
              Sombrancelhas(),
              Eyes(),
              Boca(),
              Camisa(),
            ]),
      ),
    );
  }
}

class Camisa extends StatelessWidget {
  const Camisa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(color: Colors.deepPurple[400]),
    );
  }
}

class Boca extends StatelessWidget {
  const Boca({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Container(
          color: Colors.red,
          height: 165,
          child: GridView.count(
            padding: const EdgeInsets.all(20),
            childAspectRatio: 0.6,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            crossAxisCount: 6,
            children: [
              for (int i = 0; i < 12; i++)
                Container(
                  height: 100,
                  color: Colors.amber[100],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class Testa extends StatelessWidget {
  const Testa({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: Colors.green,
    );
  }
}

class Sombrancelhas extends StatelessWidget {
  const Sombrancelhas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(
            Icons.change_history,
            size: 100,
            color: Colors.indigo,
          ),
          Icon(
            Icons.change_history,
            size: 100,
            color: Colors.indigo,
          )
        ],
      ),
    );
  }
}

class Eyes extends StatelessWidget {
  const Eyes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.remove_red_eye_sharp,
            size: 100,
            color: Colors.grey[900],
          ),
          Icon(
            Icons.arrow_downward_sharp,
            size: 100,
            color: Colors.grey[900],
          ),
          Icon(
            Icons.remove_red_eye_sharp,
            size: 100,
            color: Colors.grey[900],
          )
        ],
      ),
    );
  }
}
