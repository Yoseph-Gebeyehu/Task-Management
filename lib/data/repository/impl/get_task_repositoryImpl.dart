// ignore: file_names
import 'package:task_management/data/local/task_local_db.dart';
import 'package:task_management/data/model/task.dart';
import 'package:task_management/data/repository/get_task_repository.dart';

class GetTaskRepositoryimpl extends GetTaskRepository {
  GetTaskRepositoryimpl({required this.taskLocalDB});
  final TaskLocalDB taskLocalDB;

  @override
  Future<List<Task>> getTasksFromDataBase() {
    return taskLocalDB.getTasksFromDB();
  }
}
