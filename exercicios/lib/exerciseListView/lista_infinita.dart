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
      color: Colors.grey[100],
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: const Icon(
          Icons.star,
          color: Colors.yellow,
        ),
        title: Text(
          'Ítem nº $index',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
