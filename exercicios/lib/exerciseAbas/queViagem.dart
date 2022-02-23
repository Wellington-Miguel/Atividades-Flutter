import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

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
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20)),
                indicatorColor: Colors.blue[700],
                tabs: const [
                  Tabs('Voos', Icons.airplanemode_on_rounded),
                  Tabs('Passeios', Icons.card_travel),
                  Tabs('Mapa', Icons.map_sharp),
                ]),
          ),
          body: const TabBarView(
              children: [PageVoo(), PagePasseio(), PageMaps()]),
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
      child: ListView(
        children: [
          Center(
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
                ),
                Text(
                  '09:00H',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600]),
                ),
                const Voos(),
                Container(
                  color: Colors.grey[900],
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Partida',
                    style: GoogleFonts.aleo(
                      fontSize: 24,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                Text(
                  'Fevereiro 21, 2022',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600]),
                ),
                Text(
                  '13:00H',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600]),
                ),
                const Voos(),
                Container(
                  color: Colors.grey[900],
                  height: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Partida',
                    style: GoogleFonts.aleo(
                      fontSize: 24,
                      color: Colors.grey[900],
                    ),
                  ),
                ),
                Text(
                  'Fevereiro 22, 2022',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600]),
                ),
                Text(
                  '22:00H',
                  style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey[600]),
                ),
                const Voos()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Voos extends StatelessWidget {
  const Voos({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Center(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  'GRU',
                  style: GoogleFonts.abel(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text('Guarulhos, Brasil'),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Transform.rotate(
                  angle: 90 * pi / 180,
                  child: const Icon(
                    Icons.airplanemode_active,
                    color: Colors.green,
                    size: 40,
                  )),
            ),
            Column(
              children: [
                Text(
                  'OPO',
                  style: GoogleFonts.abel(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: Text(
                    'Porto, Portugal',
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PagePasseio extends StatelessWidget {
  const PagePasseio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                child: Text(
                  'Principais pontos turísticos do Porto. Monte seu roteiro!',
                  style: GoogleFonts.aleo(
                    fontSize: 20,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: Text(
                    'Porto, Portugal',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[600]),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Image.asset('assets/porto1.jpg')),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Text(
                    'Assim como Lisboa, a cidade do Porto é um dos destinos mais procurados por brasileiros que visitam Portugal. E não é por acaso: a cidade e as pessoas são acolhedoras, e quem vai fazer turismo lá vai se encantar também pela arquitetura, pela comida e pela atmosfera da cidade. \n A cidade merece, pelo menos, 3 dias de viagem. Assim, você consegue caminhar com calma, apreciar, tomar um vinho do Porto e curtir o dia. Porém, se só tiver 2 dias, também já vale. \n Separamos aqui os principais pontos turísticos do Porto, para incluir no seu roteiro. Confira:',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[690]),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20, 20, 5),
                  child: Text(
                    'Caves de Vinho do Porto',
                    style: GoogleFonts.aleo(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.blue[900]),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
                    child: Image.asset('assets/porto2.jpg')),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                  child: Text(
                    'Na sua ida à Ribeira, não deixe de visitar as caves de Vinho do Porto, outro dos principais pontos turísticos do Porto. Fica do outro lado do rio, em Vila Nova de Gaia. \nElas estão lá há centenas de anos. Algumas caves funcionam apenas para visitação. Em outras, ainda é envelhecido o vinho mais famoso do mundo. Em cada uma delas, um guia acompanha e explica a história, contando a fabricação e o seu comércio.',
                    style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey[690]),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PageMaps extends StatelessWidget {
  const PageMaps({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/mapa.png',
      ),
    );
  }
}
