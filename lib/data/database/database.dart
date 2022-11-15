import 'package:sqflite/sqflite.dart';
import 'package:todo_list/data/models/task_type.dart';

class DataBaseTaskType {
  static Database? database;
  static final int _version = 1;
  static final String _tableTaskType = 'task_types';

  static Future<void> initDb() async {
    if (database != null) {
      print('Fail');
      return;
    }

    try {
      String path = await getDatabasesPath() + 'todo.db';
      database = await openDatabase(
        path,
        version: _version,
        onCreate: (db, version) {
          return db.execute("""CREATE TABLE $_tableTaskType(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title TEXT,
            color TEXT,
            icon INTERGER
          )
          """);
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insertTaskType(TaskType? taskType) async {
    return await database?.insert(_tableTaskType, taskType!.toJson()) ?? 1;
  }

  static Future<List<Map<String, dynamic>>> getTaskTypes() async {
    return await database!.query(_tableTaskType, orderBy: 'id');
  }

  static Future<List<Map<String, Object?>>> getTaskType(id) async {
    return await database!.query(_tableTaskType, where: 'id=?', whereArgs: [id], limit: 1);
  }

  static Future<int> updateTaskType(TaskType task) async {
    return await database!.update(_tableTaskType, task.toJson(),where: 'id=?', whereArgs: [task.id] );
  }
  static Future<void> deleteTaskType(id) async{
    await database!.delete(_tableTaskType, where: 'id=?', whereArgs: [id]);
  }
}
