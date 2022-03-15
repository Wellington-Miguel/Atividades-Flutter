import 'package:flutter/material.dart';

class Hostel extends StatelessWidget {
  Hostel({Key? key}) : super(key: key);
  List<String> dias = ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb'];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hostel',
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Cubos Hostel',
            ),
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const TextTop(),
            Dias(dias: dias),
            const Calendario(),
            const Mes(),
          ],
        ),
      ),
    );
  }
}

class Dias extends StatelessWidget {
  const Dias({
    Key? key,
    required this.dias,
  }) : super(key: key);

  final List<String> dias;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
      child: Center(
        child: SizedBox(
          height: 40,
          child: GridView.count(
            scrollDirection: Axis.horizontal,
            crossAxisSpacing: 10,
            mainAxisSpacing: 11,
            childAspectRatio: 1.1,
            crossAxisCount: 1,
            children: [
              for (int i = 0; i < 7; i++)
                Card(
                    margin: EdgeInsets.zero,
                    color: Colors.orange[300],
                    child: Center(child: Text(dias[i])))
            ],
          ),
        ),
      ),
    );
  }
}

class Mes extends StatelessWidget {
  const Mes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Center(
        child: Text(
          'Abril, 2022',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}

class TextTop extends StatelessWidget {
  const TextTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 40),
      child: Center(
        child: Text(
          'Selecione a data da sua reserva',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

class Calendario extends StatefulWidget {
  const Calendario({
    Key? key,
  }) : super(key: key);

  @override
  State<Calendario> createState() => _CalendarioState();
}

class _CalendarioState extends State<Calendario> {
  List<int> selecionados = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: SizedBox(
        height: 250,
        child: GridView.count(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
          crossAxisCount: 7,
          children: List.generate(31, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (selecionados.any((element) => element == index)) {
                    selecionados.remove(index);
                  } else {
                    selecionados.add(index);
                  }
                });
              },
              child: Container(
                color: selecionados.any((element) => element == index)
                    ? Colors.red[400]
                    : Colors.red[100],
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
