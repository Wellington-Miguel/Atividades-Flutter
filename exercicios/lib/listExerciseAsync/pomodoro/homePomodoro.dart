import 'package:flutter/material.dart';

enum StatePomodoro {
  start,
  off,
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
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
                  color: Colors.red[900],
                ),
              ),
              Text(state == StatePomodoro.off ? pomodoroTime : '00:$time',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red[900],
                      fontWeight: FontWeight.bold)),
            ]),
            Padding(
              padding: const EdgeInsets.all(40),
              child: SizedBox(
                height: 40,
                width: 200,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red[800],
                    ),
                    onPressed: () {
                      setState(() {
                        timePomodoro();
                        state = StatePomodoro.start;
                      });
                    },
                    child: Text(
                      textButtonTime,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void timePomodoro() async {
    for (int i = time; i >= 0; i--) {
      await Future.delayed(const Duration(seconds: 1));
      time = i;
      debugPrint(time.toString());
      setState(() {
        time;
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
