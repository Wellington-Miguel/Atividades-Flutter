import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({Key? key, required this.message}) : super(key: key);
  String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second page on route'),
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: Text(message),
      ),
    );
  }
}
