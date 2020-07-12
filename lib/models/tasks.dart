import 'package:todo_app/repo/db_client.dart';

class Tasks {
  int id;
  String title;
  String type;
  String date;
  bool isComplete;

  Tasks({this.title, this.type, this.date, this.isComplete});

  Tasks.fromJson(Map<String, dynamic> map) {
    this.id = map[DbCilent.studentIdColum];
    this.title = map[DbCilent.studentTitleColum];
    this.type = map[DbCilent.studentTypeColum];
    this.date = map[DbCilent.studenDateColum];
    this.isComplete = map[DbCilent.studenisCompleteColum] == 1 ? true : false;
  }

  toJson() {
    return {
      DbCilent.studentTitleColum: this.title,
      DbCilent.studentTypeColum: this.type,
      DbCilent.studenDateColum: this.date,
      DbCilent.studenisCompleteColum: this.isComplete ? 1 : 0
    };
  }
}
