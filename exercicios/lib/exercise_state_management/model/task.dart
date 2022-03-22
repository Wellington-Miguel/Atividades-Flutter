import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Task {
  Task({required this.title, required this.objective, required this.deadline});
  final String title;
  final String objective;
  MaskTextInputFormatter deadline = MaskTextInputFormatter(
      mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
}
