import 'package:exercicio/exercise_state_management/app_task/bloc/taskEvent.dart';
import 'package:exercicio/exercise_state_management/app_task/bloc/taskState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(TaskState initialState) : super(initialState) {
    on<AddTask>((event, emit) {
      state.listTask.add(event.task);
    });
    on<RemoveTask>((event, emit) {
      state.listTask.remove(event.task);
    });
  }
}
