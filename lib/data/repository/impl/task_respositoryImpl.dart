// ignore: file_names
import 'package:task_management/data/local/task_local_db.dart';
import 'package:task_management/data/model/task.dart';

import '../task_respository.dart';

class TaskRepositoryImpl extends TaskRepository {
  TaskRepositoryImpl({required this.taskLocalDB});
  final TaskLocalDB taskLocalDB;
  @override
  Future addTaskToDatabase({required Task task}) {
    return taskLocalDB.addTaskToDB(task);
  }

  @override
  Future<List<Task>> getTasksFromDataBase() {
    return taskLocalDB.getTasksFromDB();
  }

  @override
  Future updateTask({required Task oldTask, required Task newTask}) {
    return taskLocalDB.updateTask(oldTask, newTask);
  }

  @override
  Future deleteTaskFromDB({required Task task}) {
    return taskLocalDB.deleteTaskFromDB(task);
  }

  @override
  Future deleteAllTasks() {
    return taskLocalDB.deleteAllTasks();
  }
}
