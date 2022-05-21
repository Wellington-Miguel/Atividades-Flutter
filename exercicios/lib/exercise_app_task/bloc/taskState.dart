import 'package:exercicio/exercise_app_task/model/task.dart';

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
