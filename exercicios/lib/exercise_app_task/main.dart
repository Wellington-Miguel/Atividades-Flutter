import 'package:exercicio/exercise_app_task/bloc/taskBloc.dart';
import 'package:exercicio/exercise_app_task/bloc/taskState.dart';
import 'package:exercicio/exercise_app_task/bloc/theme_cubit.dart';
import 'package:exercicio/exercise_app_task/model/task.dart';
import 'package:exercicio/exercise_app_task/pages/home_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final initialTheme =
                WidgetsBinding.instance.window.platformBrightness == Brightness.dark ?
                    Brightness.light : Brightness.dark;
            return ThemeModeCubit(initialTheme);
          },
        ),
        BlocProvider(
          create: (context) {
            List<Task> listTask = [];
            final inicialState = TaskState(listTask: listTask);
            return TaskBloc(inicialState);
          },
        ),
      ],
      child: BlocBuilder<ThemeModeCubit, ThemeData>(
        builder: (context, themeTaskState) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: themeTaskState,
            home: const HomeTask(),
          );
        },
      ),
    ),
  );
}
