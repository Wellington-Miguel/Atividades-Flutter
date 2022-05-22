import 'package:flutter/material.dart';

class TitleTab extends StatelessWidget {
  const TitleTab({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(40, 10, 40, 0),
      child: Center(
          child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12, color: Colors.white),
      )),
    );
  }
}
