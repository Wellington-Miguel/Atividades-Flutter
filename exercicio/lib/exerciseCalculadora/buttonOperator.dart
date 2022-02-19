import 'package:flutter/material.dart';

typedef OperadorFuncion = void Function(String);

class buttonOperator extends StatelessWidget {
  IconData iconOperator;
  buttonOperator({
    required this.iconOperator,
    Key? key,
    required this.OperadorCallBack,
    required this.operador,
  }) : super(key: key);
  final OperadorFuncion OperadorCallBack;
  final String operador;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        onPressed: () {
          OperadorCallBack(operador);
        },
        icon: const Icon(Icons.close),
      ),
    );
  }
}
