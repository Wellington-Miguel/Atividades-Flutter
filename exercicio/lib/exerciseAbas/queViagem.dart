import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViagensEcommerce extends StatelessWidget {
  ViagensEcommerce({Key? key}) : super(key: key);

  final icons = [Icons.card_travel, Icons.map_rounded];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Viagens Ecommerce',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[700],
            leading: Icon(
              Icons.travel_explore_outlined,
              color: Colors.amber[600],
            ),
            title: Center(
              child: Text(
                'Viagens Ecommerce',
                style: GoogleFonts.aleo(
                    wordSpacing: 4, fontWeight: FontWeight.bold),
              ),
            ),
            bottom: TabBar(
                indicator: BoxDecoration(
                    color: Colors.amber[600],
                    borderRadius: BorderRadius.circular(40)),
                indicatorColor: Colors.blue[700],
                tabs: const [
                  Tabs('Voos', Icons.airplanemode_on_rounded),
                  Tabs('Passeios', Icons.card_travel),
                  Tabs('Mapa', Icons.map_sharp),
                ]),
          ),
          body: const TabBarView(children: [PageVoo(), PageVoo(), PageVoo()]),
        ),
      ),
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs(
    this.nome,
    this.icon, {
    Key? key,
  }) : super(key: key);
  final String nome;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Tab(
      text: nome,
      icon: Icon(icon),
    );
  }
}

class PageVoo extends StatelessWidget {
  const PageVoo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Column(
          children: [
            Text(
              'Partida',
              style: GoogleFonts.aleo(
                fontSize: 24,
                color: Colors.grey[900],
              ),
            ),
            Text(
              'Fevereiro 20, 2022',
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }
}
