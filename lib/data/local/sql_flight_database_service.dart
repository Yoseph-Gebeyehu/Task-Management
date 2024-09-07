import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:task_management/domain/constant/app_database_tables.dart';

class SqlFlightDatabaseService {
  static const String dataBaseName = "task_management.db";

  static Future<String> getDatabasePath() async {
    final dbPath = await sql.getDatabasesPath();
    return path.join(dbPath, dataBaseName);
  }

  static Future<sql.Database> openDatabase() async {
    final dbpath = await getDatabasePath();
    return await sql.openDatabase(
      dbpath,
      version: 1,
      onCreate: (sql.Database db, int version) async {
        await db.execute('''
          CREATE TABLE ${AppDatabaseTables.task} (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT,
            description TEXT,
            startingTime TEXT,
            endingTime TEXT,
            isCompleted INTEGER
          )
        ''');
      },
    );
  }

  static Future<void> deleteDatabase() async {
    final dbPath = await getDatabasePath();
    await sql.deleteDatabase(dbPath);
  }
}
