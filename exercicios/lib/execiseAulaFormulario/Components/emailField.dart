import 'package:flutter/material.dart';

import '../resouces/strings.dart';

class emailField extends StatelessWidget {
  emailField({
    Key? key,
    required this.buildValidatorEmail,
  }) : super(key: key);
  String? Function(String?) buildValidatorEmail;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        isDense: true,
        labelText: Words.email,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: buildValidatorEmail,
    );
  }
}
