import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management/domain/constant/app_database_tables.dart';
import 'sql_flight_database_service.dart';
import 'package:task_management/data/model/task.dart';

class TaskLocalDB {
  Future<void> addTaskToDB(Task task) async {
    Map<String, dynamic> data = task.toJson();
    sql.Database db = await SqlFlightDatabaseService.openDatabase();
    await db.insert(
      AppDatabaseTables.task,
      data,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );
  }

  Future<List<Task>> getTasksFromDB() async {
    List<Task> tasks = [];
    sql.Database db = await SqlFlightDatabaseService.openDatabase();
    var result = await db.query(AppDatabaseTables.task);
    if (result.isNotEmpty) {
      for (int i = 0; i < result.length; i++) {
        tasks.add(Task.fromJson(result[i]));
      }
    }
    return tasks;
  }

  Future deleteTaskFromDB() async {
    sql.Database db = await SqlFlightDatabaseService.openDatabase();
    var result = await db.delete(AppDatabaseTables.task);
    return result;
  }
}
