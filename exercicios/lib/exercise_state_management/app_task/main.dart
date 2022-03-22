import 'package:exercicio/exercise_state_management/app_task/bloc/theme_cubit.dart';
import 'package:exercicio/exercise_state_management/app_task/pages/home_task.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) {
        final initialTheme =
            WidgetsBinding.instance?.window.platformBrightness ??
                Brightness.light;
        return ThemeModeCubit(initialTheme);
      },
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
