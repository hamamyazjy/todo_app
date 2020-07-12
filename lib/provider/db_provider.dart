import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/repo/repository.dart';

class DbProvider extends ChangeNotifier {
  List<Tasks> tasks = [];
  TimeOfDay time = TimeOfDay(hour: 0, minute: 00);
  String type;

  bool isPersonal = false;
  bool isWork = false;
  bool isMeeting = false;
  bool isStudy = false;
  bool isShopping = false;
  bool isParty = false;

  selecteType(int index) {
    switch (index) {
      case 0:
        isPersonal = true;
        isWork = false;
        isMeeting = false;
        isStudy = false;
        isShopping = false;
        isParty = false;
        type = 'Personal';
        break;
      case 1:
        isPersonal = false;
        isWork = true;
        isMeeting = false;
        isStudy = false;
        isShopping = false;
        isParty = false;
        type = 'Work';
        break;
      case 2:
        isPersonal = false;
        isWork = false;
        isMeeting = true;
        isStudy = false;
        isShopping = false;
        isParty = false;
        type = 'Meeting';
        break;
      case 3:
        isPersonal = false;
        isWork = false;
        isMeeting = false;
        isStudy = true;
        isShopping = false;
        isParty = false;
        type = 'Study';
        break;
      case 4:
        isPersonal = false;
        isWork = false;
        isMeeting = false;
        isStudy = false;
        isShopping = true;
        isParty = false;
        type = 'Shopping';
        break;
      case 5:
        isPersonal = false;
        isWork = false;
        isMeeting = false;
        isStudy = false;
        isShopping = false;
        isParty = true;
        type = 'Party';
        break;
      default:
    }
    notifyListeners();
  }

  Future<TimeOfDay> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (picked != null && picked != time) {
      time = picked;
    }
    return picked;
  }

  Future<List<Tasks>> setAllTasks() async {
    tasks = await DbRepository.dbRepository.getAllTask();
    notifyListeners();
    return tasks;
  }

  Future<List<Tasks>> setTaskByType(String type) async {
    tasks = await DbRepository.dbRepository.getTaskByType(type);
    setAllTasks();
    // notifyListeners();
    return tasks;
  }

  insertNewTask(Tasks tasks) async {
    await DbRepository.dbRepository.insertNewTask(tasks);
    setAllTasks();
  }

  deleteAllTasks() async {
    await DbRepository.dbRepository.deleteAllTasks();
    setAllTasks();
  }

  deleteTasksById(int id) async {
    await DbRepository.dbRepository.deleteTasksById(id);
    setAllTasks();
  }

  updateTasksById(int id, Tasks tasks) async {
    await DbRepository.dbRepository.updateTasksById(id, tasks);
    setAllTasks();
  }
}
