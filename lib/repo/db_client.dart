import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbCilent {
  DbCilent._();

  static DbCilent dbClient = DbCilent._();

  static final String dbName = 'tasks.db';
  static final String studentTableName = 'tasks';
  static final String studentIdColum = 'id';
  static final String studentTitleColum = 'title';
  static final String studentTypeColum = 'type';
  static final String studenDateColum = 'date';
  static final String studenisCompleteColum = 'isComplete';

  Database database;

  initDb() async {
    if (database != null) {
      return database;
    } else {
      return await connectToDb();
    }
  }

  connectToDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = appDocDir.path;

    String dbpath = join(path, dbName);

    Database db =
        await openDatabase(dbpath, version: 1, onCreate: (db, version) {
      db.execute('''
        create table $studentTableName(
          $studentIdColum INTEGER PRIMARY KEY AUTOINCREMENT,
          $studentTitleColum TEXT NOT NULL,
          $studentTypeColum TEXT NOT NULL,
          $studenDateColum TEXT NOT NULL,
          $studenisCompleteColum INTEGER NOT NULL
        )
        ''');
    });

    return db;
  }

  insertNewTask(Map<String, dynamic> map) async {
    try {
      database = await initDb();
      int rowIndex = await database.insert(studentTableName, map);

      print('$rowIndex insert');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getAllTask() async {
    try {
      database = await initDb();
      List<Map<String, dynamic>> result =
          await database.query(studentTableName);

      return result;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<Map<String, dynamic>>> getTaskByType(String type) async {
    try {
      database = await initDb();
      List<Map<String, dynamic>> result = await database.query(studentTableName,
          where: '$studentTypeColum=?', whereArgs: [type]);

      return result;
    } catch (e) {
      print(e.toString());
    }
  }

  deleteAllTasks() async {
    database = await initDb();
    int x = await database.delete(studentTableName);
    print('$x delete all');
  }

  deleteTasksById(int id) async {
    database = await initDb();
    database
        .delete(studentTableName, where: '$studentIdColum=?', whereArgs: [id]);
  }

  updateTasksById(int id, Map<String, dynamic> map) async {
    database = await initDb();

    int indexUpdate = await database.update(studentTableName, map,
        where: '$studentIdColum=?', whereArgs: [id]);

    print('$indexUpdate Update');
  }
}
