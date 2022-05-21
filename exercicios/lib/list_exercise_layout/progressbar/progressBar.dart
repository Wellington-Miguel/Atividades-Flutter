import 'dart:math';

import 'package:flutter/material.dart';

class progressBar extends StatefulWidget {
  const progressBar({Key? key}) : super(key: key);

  @override
  _progressBarState createState() => _progressBarState();
}

class _progressBarState extends State<progressBar> {
  Random random = Random();
  int porcent = 0;
  String info = 'Clique para fazer o upload';
  MaterialColor progresscolor = Colors.blue;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'AppBarIcon',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Barra de progresso'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: progresscolor,
                  ),
                  onPressed: () {
                    setState(() {
                      if (porcent <= 100) {
                        porcent += random.nextInt(20);
                        info = '${porcent.toString()}%';
                      }
                      if (porcent >= 100) {
                        porcent = 100;
                        progresscolor = Colors.green;
                        info = 'Upload concluído';
                      }
                    });
                  },
                  child: const Text('Upload'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(info),
              ),
              SizedBox(
                width: 200,
                height: 5,
                child: LinearProgressIndicator(
                  value: porcent / 100,
                  color: progresscolor,
                  backgroundColor: Colors.black,
                  semanticsLabel: 'Progresso',
                ),
              )
            ],
          ),
        ));
  }
}
