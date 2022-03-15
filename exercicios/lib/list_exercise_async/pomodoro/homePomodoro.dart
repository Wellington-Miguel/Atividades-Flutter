import 'package:flutter/material.dart';

enum StatePomodoro {
  start,
  off,
  rest,
}

class HomePomodoro extends StatefulWidget {
  const HomePomodoro({Key? key}) : super(key: key);

  @override
  State<HomePomodoro> createState() => _HomePomodoroState();
}

class _HomePomodoroState extends State<HomePomodoro> {
  final textTask = TextEditingController();
  String task = '';
  StatePomodoro state = StatePomodoro.off;
  String textButtonTask = 'Adicione uma tarefa';
  String pomodoroTime = 'Pomodoro Time';
  String textButtonTime = 'Iniciar pomodoro';
  double porcentProgress = 0;
  int time = 30;
  bool count = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.apple,
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: const Text('My Pomodoro'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(70),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: state == StatePomodoro.start ||
                                state == StatePomodoro.off
                            ? Colors.red[900]
                            : Colors.green,
                      ),
                      onPressed: () {
                        addTask();
                      },
                      child: Text(textButtonTask)),
                ),
              ),
              Stack(alignment: Alignment.center, children: [
                SizedBox(
                  height: 300,
                  width: 300,
                  child: CircularProgressIndicator(
                    strokeWidth: 40,
                    value: porcentProgress,
                    backgroundColor: Colors.black,
                    color: state == StatePomodoro.start ||
                            state == StatePomodoro.off
                        ? Colors.red[900]
                        : Colors.green,
                  ),
                ),
                Text(state == StatePomodoro.off ? pomodoroTime : '00:$time',
                    style: TextStyle(
                        fontSize: 30,
                        color: state == StatePomodoro.start ||
                                state == StatePomodoro.off
                            ? Colors.red[900]
                            : Colors.green,
                        fontWeight: FontWeight.bold)),
              ]),
              Padding(
                padding: const EdgeInsets.all(40),
                child: SizedBox(
                  height: 40,
                  width: 200,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: state == StatePomodoro.rest
                            ? Colors.green
                            : Colors.red[800],
                      ),
                      onPressed: count == true
                          ? null
                          : () {
                              timePomodoro();
                              if (time == 30) {
                                setState(() {
                                  state = StatePomodoro.start;
                                  textButtonTime = 'Go Go Go';
                                });
                              } else if (time == 15) {
                                setState(() {
                                  state = StatePomodoro.rest;
                                  textButtonTime = 'Hora de descansar';
                                });
                              }
                            },
                      child: Text(
                        textButtonTime,
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void timePomodoro() async {
    for (int i = time; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      time = i;
      count = true;

      if (state == StatePomodoro.rest) {
        porcentProgress -= (3.3 / 100) * 2;
      } else {
        porcentProgress += 3.3 / 100;
      }
      debugPrint(porcentProgress.toString());
      setState(() {
        time;
        porcentProgress;
      });
    }
    if (time == 0 && state == StatePomodoro.start) {
      setState(() {
        time = 15;
        state = StatePomodoro.rest;
        textButtonTime = 'Iniciar descanso';
        count = false;
      });
    } else if (time == 0 && state == StatePomodoro.rest) {
      setState(() {
        time == 30;
        textButtonTask = 'Adicione uma tarefa';
        textButtonTime = 'Iniciar pomodoro';
        state = StatePomodoro.off;
        count = false;
      });
    }
  }

  void addTask() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: TextField(
              controller: textTask,
              decoration: const InputDecoration(
                isDense: true,
                label: Text(
                  'Digite sua tarefa',
                ),
                border: OutlineInputBorder(),
              ),
            ),
            actions: [
              ButtonHome('Adicionar tarefa', () {
                textButtonTask = textTask.text;
                if (textButtonTask != '') {
                  setState(() {
                    textButtonTask;
                  });
                }
                Navigator.pop(context);
                textTask.text = '';
              }, Colors.red[800]),
              ButtonHome('Cancelar', () {
                Navigator.pop(context);
              }, Colors.grey)
            ],
          );
        });
  }
}

class ButtonHome extends StatelessWidget {
  ButtonHome(
    this.text,
    this.onPress,
    this.color, {
    Key? key,
  }) : super(key: key);
  String text = '';
  void Function()? onPress;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        onPressed: onPress,
        child: Text(text),
      ),
    );
  }
}
