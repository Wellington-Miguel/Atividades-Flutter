import 'package:flutter/material.dart';

int easterEgg = 0;
void ShowEasterEgg(int value, BuildContext context) {
  easterEgg += value;
  if (easterEgg >= 2) {
    easterEgg = 0;
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('Clique em um número para começar'),
    ));
  }
}
