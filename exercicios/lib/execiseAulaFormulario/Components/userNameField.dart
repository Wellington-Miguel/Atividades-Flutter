import 'package:flutter/material.dart';
import '../resouces/strings.dart';

class UsernameField extends StatelessWidget {
  UsernameField({
    Key? key,
    required this.validatorBuild,
  }) : super(key: key);
  String? Function(String?) validatorBuild;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        isDense: true,
        labelText: Words.userName,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validatorBuild,
    );
  }
}
