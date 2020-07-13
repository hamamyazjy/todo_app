import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/repo/repository.dart';

class DbProvider extends ChangeNotifier {
  List<Tasks> tasks = [];
  DateTime time = DateTime(2009);
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
        isStudy = false;
        isShopping = true;
        isParty = false;
        type = 'Shopping';
        break;
      case 4:
        isPersonal = false;
        isWork = false;
        isMeeting = false;
        isStudy = false;
        isShopping = false;
        isParty = true;
        type = 'Party';
        break;
      case 5:
        isPersonal = false;
        isWork = false;
        isMeeting = false;
        isStudy = true;
        isShopping = false;
        isParty = false;
        type = 'Study';
        break;
      default:
    }
    notifyListeners();
  }

  selectTime(BuildContext context) async {
    DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2020, 3, 5),
        maxTime: DateTime(2030, 6, 7), onChanged: (date) {
      time = date;
      notifyListeners();
    }, onConfirm: (date) {
      time = date;
      notifyListeners();
    }, currentTime: DateTime.now(), locale: LocaleType.en);
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

  Future<List<Tasks>> setTasksByNameWithLike(Pattern type) async {
    tasks = await DbRepository.dbRepository.getTasksByNameWithLike(type);
    setAllTasks();
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
