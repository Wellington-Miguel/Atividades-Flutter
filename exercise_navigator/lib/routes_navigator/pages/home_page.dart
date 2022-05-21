import 'package:exercise_navigator/routes_navigator/dto/interfaces/imessage.dart';
import 'package:exercise_navigator/routes_navigator/dto/message_page_dto.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Initial page on route'),
        backgroundColor: Colors.red[400],
      ),
      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red[900]),
            onPressed: () {
              imessage message = MessageSecondPage();
              Navigator.pushNamed(context, '/second',
                  arguments: message.message);
            },
            child: const Text('Next Page!')),
      ),
    );
  }
}
