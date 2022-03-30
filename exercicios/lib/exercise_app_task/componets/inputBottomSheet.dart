import 'package:flutter/material.dart';

class InputBottomSheet extends StatelessWidget {
  InputBottomSheet({
    required this.label,
    required this.controller,
    Key? key,
  }) : super(key: key);
  String label;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          label: Text(label),
        ),
      ),
    );
  }
}
