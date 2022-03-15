import 'package:flutter/material.dart';

class buttomTheme extends StatefulWidget {
  buttomTheme({Key? key, required this.thememode, required this.onpress})
      : super(key: key);
  bool thememode = true;

  final Function(bool) onpress;

  @override
  State<buttomTheme> createState() => _buttomThemeState();
}

class _buttomThemeState extends State<buttomTheme> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        widget.thememode = widget.thememode ? false : true;
        widget.onpress(widget.thememode);
      },
      child: Icon(
        widget.thememode ? Icons.light_mode : Icons.light_mode_outlined,
      ),
    );
  }
}
