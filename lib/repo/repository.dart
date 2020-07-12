import 'package:todo_app/models/tasks.dart';

import 'db_client.dart';

class DbRepository {
  DbRepository._();

  static DbRepository dbRepository = DbRepository._();

  insertNewTask(Tasks task) async {
    await DbCilent.dbClient.insertNewTask(task.toJson());
  }

  Future<List<Tasks>> getAllTask() async {
    List<Map<String, dynamic>> result = await DbCilent.dbClient.getAllTask();

    List<Tasks> tasks = result.map((e) => Tasks.fromJson(e)).toList();

    return tasks;
  }

  Future<List<Tasks>> getTaskByType(String type) async {
    List<Map<String, dynamic>> result =
        await DbCilent.dbClient.getTaskByType(type);

    List<Tasks> tasks = result.map((e) => Tasks.fromJson(e)).toList();

    return tasks;
  }

  deleteAllTasks() async {
    await DbCilent.dbClient.deleteAllTasks();
  }

  deleteTasksById(int id) async {
    await DbCilent.dbClient.deleteTasksById(id);
  }

  updateTasksById(int id, Tasks tasks) async {
    await DbCilent.dbClient.updateTasksById(id, tasks.toJson());
  }

  
}
