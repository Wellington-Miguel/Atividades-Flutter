import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../resouces/strings.dart';

class passwordField extends StatefulWidget {
  passwordField({
    Key? key,
    required this.obscurepass,
    required this.buildValidatorPassword,
  }) : super(key: key);

  bool obscurepass;
  String? Function(String?) buildValidatorPassword;

  @override
  State<passwordField> createState() => _passwordFieldState();
}

class _passwordFieldState extends State<passwordField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          helperText: Words.passwordHelp,
          isDense: true,
          labelText: Words.password,
          border: const OutlineInputBorder(),
          suffixIcon: ExcludeFocus(
            child: IconButton(
              icon: Icon(
                widget.obscurepass
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined,
              ),
              onPressed: () {
                setState(() {
                  widget.obscurepass = widget.obscurepass ? false : true;
                });
              },
            ),
          )),
      keyboardType: TextInputType.number,
      textInputAction: TextInputAction.next,
      obscureText: widget.obscurepass,
      inputFormatters: [LengthLimitingTextInputFormatter(16)],
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.buildValidatorPassword,
    );
  }
}
