import 'package:exercicio/listExerciseAsync/pomodoro/homePomodoro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro time',
      home: HomePomodoro(),
    ),
  );
}
