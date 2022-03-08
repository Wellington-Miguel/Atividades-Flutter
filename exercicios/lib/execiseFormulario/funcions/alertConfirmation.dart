import 'package:flutter/material.dart';

import '../resouces/strings.dart';

void alertConfimation(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            Words.titeConfirmation,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          content: Text(
            Words.contentConfirmation,
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
          actions: [
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Sair'),
            ),
            TextButton(
              onPressed: Navigator.of(context).pop,
              child: const Text('Confirmar'),
            ),
          ],
        );
      });
}
