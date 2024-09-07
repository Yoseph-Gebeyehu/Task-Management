import 'package:task_management/data/model/task.dart';

abstract class TaskRepository {
  Future addTaskToDatabase({required Task task});
  Future<List<Task>> getTasksFromDataBase();
  Future deleteTaskFromDB();
}
