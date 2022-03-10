import 'package:flutter/material.dart';

import '../resouces/strings.dart';

class fullNameField extends StatelessWidget {
  fullNameField({
    Key? key,
    required this.validatorBuild,
  }) : super(key: key);
  String? Function(String?) validatorBuild;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        labelText: Words.fullname,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.name,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (text) {
        final fullNameNotNull = validatorBuild(text);
        if (fullNameNotNull != null) {
          return fullNameNotNull;
        }
        if (fullNameNotNull == null && text != null) {
          if (text.split(' ').length == 1) {
            return Words.erroFullName;
          }
        }
        return null;
      },
    );
  }
}
