import 'package:exercicio/exercise_state_management/app_task/model/task.dart';

abstract class TaskEvent {
  const TaskEvent();
}

class AddTask extends TaskEvent {
  final Task task;
  const AddTask({required this.task});
}

class RemoveTask extends TaskEvent {
  final Task task;
  const RemoveTask({required this.task});
}
