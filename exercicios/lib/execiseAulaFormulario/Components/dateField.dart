import 'package:flutter/material.dart';

import '../resouces/strings.dart';

class dateField extends StatelessWidget {
  dateField({
    Key? key,
    required this.dateFocusController,
    required this.dateController,
    required this.validatorBuild,
    required this.dateDialog,
  }) : super(key: key);

  final FocusNode dateFocusController;
  final TextEditingController dateController;
  String? Function(String?) validatorBuild;
  void Function() dateDialog;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 6,
      child: Focus(
        descendantsAreFocusable: false,
        focusNode: dateFocusController,
        onFocusChange: (focus) {
          // if (focus) dateDialog();
        },
        child: TextFormField(
          controller: dateController,
          decoration: InputDecoration(
            isDense: true,
            labelText: Words.birthDate,
            border: const OutlineInputBorder(),
          ),
          keyboardType: TextInputType.datetime,
          textInputAction: TextInputAction.next,
          onTap: dateDialog,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: validatorBuild,
        ),
      ),
    );
  }
}
