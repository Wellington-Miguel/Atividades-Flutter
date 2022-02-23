import 'package:flutter/material.dart';

typedef numberPressCallBack = void Function(String);

class numberButton extends StatelessWidget {
  const numberButton({
    Key? key,
    required this.number,
    required this.numberPress,
  }) : super(key: key);
  final numberPressCallBack numberPress;
  final String number;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () {
            numberPress(number);
          },
          child: Text(number),
        ),
      ),
    );
  }
}
