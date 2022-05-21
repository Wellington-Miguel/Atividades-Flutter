import 'package:flutter/material.dart';
import 'easterEgg.dart';

class Display extends StatefulWidget {
  final String display;
  const Display({
    Key? key,
    required this.display,
  }) : super(key: key);

  @override
  State<Display> createState() => _DisplayState();
}

class _DisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ShowEasterEgg(1, context);
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(20),
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(widget.display),
          ),
        ),
      ),
    );
  }
}
