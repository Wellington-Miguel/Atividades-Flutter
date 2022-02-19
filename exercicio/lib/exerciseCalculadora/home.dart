import 'package:exercicio/exerciseCalculadora/buttomTheme.dart';
import 'package:flutter/material.dart';
import 'buttonOperator.dart';
import 'numberButton.dart';
import 'display.dart';

class Home extends StatefulWidget {
  bool thememode = true;
  Function(bool) onpresstheme;
  Home({
    required this.onpresstheme,
    required this.thememode,
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String display = '0';

  String firstnumber = '';

  void pressbutton(String number) {
    firstnumber += number;
    setState(() {
      display = firstnumber;
    });
  }

  void clear() {
    setState(() {
      display = '0';
      firstnumber = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 87.0),
        child: FloatingActionButton(
          splashColor: Colors.blue[200],
          onPressed: () {
            clear();
          },
          child: const Text(
            'C',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      appBar: AppBar(
        leading: const Icon(
          Icons.calculate,
          color: Colors.white,
        ),
        actions: [
          buttomTheme(
              thememode: widget.thememode,
              onpress: (bool value) {
                widget.onpresstheme(value);
                setState(() {
                  widget.thememode = value;
                });
              })
        ],
        title: const Text('Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              flex: 3,
              child: Display(
                display: display,
              )),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                numberButton(number: '7', numberPress: pressbutton),
                numberButton(number: '8', numberPress: pressbutton),
                numberButton(number: '9', numberPress: pressbutton),
                buttonOperator(
                  iconOperator: Icons.close,
                  operador: 'x',
                  OperadorCallBack: pressbutton,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                numberButton(number: '4', numberPress: pressbutton),
                numberButton(number: '5', numberPress: pressbutton),
                numberButton(number: '6', numberPress: pressbutton),
                buttonOperator(
                  iconOperator: Icons.remove,
                  operador: '-',
                  OperadorCallBack: pressbutton,
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                numberButton(number: '1', numberPress: pressbutton),
                numberButton(number: '2', numberPress: pressbutton),
                numberButton(number: '3', numberPress: pressbutton),
                buttonOperator(
                  iconOperator: Icons.add,
                  operador: '+',
                  OperadorCallBack: pressbutton,
                ),
              ],
            ),
          ),
          const Expanded(child: Text('')),
        ],
      ),
    );
  }
}
