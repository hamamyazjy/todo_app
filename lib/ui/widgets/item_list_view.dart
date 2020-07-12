import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/provider/db_provider.dart';

class ItemsListView extends StatelessWidget {
  bool isComplete = false;
  String title;
  String type;
  String date;
  int id;
  ItemsListView({this.isComplete, this.title, this.type, this.date, this.id});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 55.21,
        width: 339.00,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0.00, 4.00),
              color: Color(0xff000000).withOpacity(0.05),
              blurRadius: 9,
            ),
          ],
          borderRadius: BorderRadius.circular(5.00),
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 55.21,
              width: 4.00,
              decoration: BoxDecoration(
                color: type == 'Personal'
                    ? Color(0xffffd506)
                    : type == 'Work'
                        ? Color(0xff5de61a)
                        : type == 'Meeting'
                            ? Color(0xffd10263)
                            : type == 'Study'
                                ? Color(0xff3044f2)
                                : type == 'Shopping'
                                    ? Color(0xfff29130)
                                    : Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.00, 3.00),
                    color: Color(0xfff3e625).withOpacity(0.27),
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5.00),
                  bottomLeft: Radius.circular(5.00),
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Consumer<DbProvider>(
              builder: (context, dbProvider, widget) {
                return GestureDetector(
                  child: Icon(
                    Icons.check_circle_outline,
                    size: 30,
                    color: isComplete ? Colors.green : Colors.grey,
                  ),
                  onTap: () {
                    dbProvider.updateTasksById(
                        id,
                        Tasks(
                            date: date,
                            isComplete: !isComplete,
                            title: title,
                            type: type));
                  },
                );
              },
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              date,
              style: TextStyle(
                fontSize: 11,
                color: Color(0xffc6c6c8),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                decoration: isComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 14,
                color: isComplete ? Colors.grey : Color(0xff554e8f),
              ),
            )
          ],
        ),
      ),
    );
  }
}
