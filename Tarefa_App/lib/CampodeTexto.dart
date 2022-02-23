import 'package:flutter/material.dart';

class CampodeTexto extends StatelessWidget {
  const CampodeTexto({this.label, this.hint, this.icone, this.imput, Key? key})
      : super(key: key);
  final String? label;
  final String? hint;
  final IconData? icone;
  final TextEditingController? imput;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(
            width: 2,
            color: Colors.green,
          ),
        ),
        elevation: 5,
        shadowColor: Colors.green[900],
        child: Container(
          padding: const EdgeInsets.all(5),
          child: TextField(
            controller: imput,
            style: const TextStyle(
              fontSize: 20,
            ),
            decoration: InputDecoration(
                icon: Icon(
                  icone,
                  color: Colors.green,
                  size: 30,
                ),
                labelStyle: const TextStyle(color: Colors.black),
                hintText: hint,
                labelText: label),
          ),
        ),
      ),
    );
  }
}
