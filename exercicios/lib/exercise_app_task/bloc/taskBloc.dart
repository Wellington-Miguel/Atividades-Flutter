import 'package:exercicio/exercise_app_task/bloc/taskEvent.dart';
import 'package:exercicio/exercise_app_task/bloc/taskState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc(TaskState initialState) : super(initialState) {
    on<AddTask>((event, emi) {
      state.listTask.add(event.task);
      emit(AddState(listTask: state.listTask));
    });
    on<RemoveTask>((event, emit) {
      state.listTask.remove(event.task);
      emit(RemoveState(listTask: state.listTask));
    });
  }
}
