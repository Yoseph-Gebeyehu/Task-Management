import 'package:task_management/data/model/task.dart';

abstract class AddTaskRepository {
  Future addTaskToDatabase({required Task task});
}
