import 'package:exercicio/exercise_state_management/app_task/model/task.dart';

class TaskState {
  TaskState({required this.listTask});
  List<Task> listTask;
}

class AddState extends TaskState {
  AddState({required List<Task> listTask}) : super(listTask: listTask);
}

class RemoveState extends TaskState {
  RemoveState({required List<Task> listTask}) : super(listTask: listTask);
}
