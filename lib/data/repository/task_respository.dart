import 'dart:async';

import 'package:task_management/data/model/task.dart';

abstract class TaskRepository {
  Future addTaskToDatabase({required Task task});
  Future<List<Task>> getTasksFromDataBase();
  Future updateTask({required Task oldTask, required Task newTask});
  Future deleteTaskFromDB({required Task task});
  Future deleteAllTasks();
}
