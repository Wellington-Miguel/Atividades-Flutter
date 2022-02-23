import 'package:flutter/material.dart';

class ListaInfinita extends StatefulWidget {
  const ListaInfinita({Key? key}) : super(key: key);

  @override
  State<ListaInfinita> createState() => _ListaInfinitaState();
}

class _ListaInfinitaState extends State<ListaInfinita> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Lista infinita',
            ),
          ),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ItemLista(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemLista extends StatelessWidget {
  const ItemLista(
    this.index, {
    Key? key,
  }) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 60,
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: BoxDecoration(color: Colors.grey[100]),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(20),
            child: Icon(
              Icons.star,
              color: Colors.yellow,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 130),
            child: Text(
              'Ítem nº $index',
              style: const TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
