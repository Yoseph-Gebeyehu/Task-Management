import 'package:task_management/data/model/task.dart';

abstract class GetTaskRepository {
  Future<List<Task>> getTasksFromDataBase();
}
