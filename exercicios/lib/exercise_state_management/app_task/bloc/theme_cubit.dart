import 'package:bloc/bloc.dart';
import 'package:exercicio/exercise_state_management/app_task/resouces/theme.dart';
import 'package:flutter/material.dart';

class ThemeModeCubit extends Cubit<ThemeData> {
  ThemeModeCubit(Brightness inicial)
      : super(inicial == Brightness.light
            ? ThemeTask.taskThemeLigth
            : ThemeTask.taskThemeDark);

  void changeTheme() {
    emit(state == ThemeTask.taskThemeLigth
        ? ThemeTask.taskThemeDark
        : ThemeTask.taskThemeLigth);
  }
}
