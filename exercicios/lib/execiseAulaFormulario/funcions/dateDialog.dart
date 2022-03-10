import 'package:flutter/material.dart';

dateDialog(BuildContext context) {
  DateTime? selctedDate;
  final dateFocusController = FocusNode();
  final dateController = TextEditingController();
  final phoneFocusController = FocusNode();
  final currentDate = DateTime.now();
  final firstDate = DateTime(
    currentDate.year - 18,
    currentDate.month,
    currentDate.day,
  );

  showDatePicker(
    context: context,
    initialDate: selctedDate ?? firstDate,
    firstDate: DateTime(1900),
    lastDate: currentDate,
    initialDatePickerMode: DatePickerMode.year,
    initialEntryMode: DatePickerEntryMode.calendarOnly,
  ).then((selected) {
    if (selected != null) {
      selctedDate = selected;
      dateController.text =
          "${selected.day}/${selected.month}/${selected.year}";
      phoneFocusController.requestFocus();
    }
  });

  dateFocusController.unfocus();
}
