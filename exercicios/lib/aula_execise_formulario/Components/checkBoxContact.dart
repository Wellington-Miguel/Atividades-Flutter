import 'package:flutter/material.dart';

class CheckBoxContact extends StatefulWidget {
  CheckBoxContact({
    Key? key,
    required this.check,
    required this.onchange,
    required this.text,
    required this.label,
    required this.theme,
  }) : super(key: key);
  bool check = true;
  Function(bool?) onchange;
  String text;
  IconData label;
  bool theme;
  @override
  State<CheckBoxContact> createState() => _CheckBoxContactState();
}

class _CheckBoxContactState extends State<CheckBoxContact> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      dense: true,
      tileColor: widget.theme ? Colors.green[200] : Colors.green[900],
      secondary: Icon(widget.label),
      title: Text(
        widget.text,
      ),
      value: widget.check,
      onChanged: widget.onchange,
    );
  }
}
