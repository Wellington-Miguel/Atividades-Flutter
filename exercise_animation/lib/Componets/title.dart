import 'package:flutter/material.dart';

class TitleTab extends StatelessWidget {
  const TitleTab({required this.title, Key? key}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(child: Text(title)),
    );
  }
}
