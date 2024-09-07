// ignore: file_names
import 'package:task_management/data/local/task_local_db.dart';
import 'package:task_management/data/model/task.dart';

import '../add_task_respository.dart';

class AddTaskRepositoryImpl extends AddTaskRepository {
  AddTaskRepositoryImpl({required this.taskLocalDB});
  final TaskLocalDB taskLocalDB;
  @override
  Future addTaskToDatabase({required Task task}) {
    return taskLocalDB.addTaskToDB(task);
  }
}
