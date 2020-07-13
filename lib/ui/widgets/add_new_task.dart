import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/screens/home.dart';
import 'package:todo_app/ui/widgets/type_task.dart';

class AddNewTask extends StatelessWidget {
  TextEditingController _titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    DbProvider dbProvider = Provider.of<DbProvider>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add new task",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 25,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                    labelText: 'title Task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
            Container(
              height: 1.00,
              width: 333.00,
              color: Color(0xffcfcfcf),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    dbProvider.selecteType(0);
                  },
                  child: TypeTask(
                    color: Color(0xffffd506),
                    type: 'Personal',
                    isSelecte: dbProvider.isPersonal,
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                GestureDetector(
                  onTap: () {
                    dbProvider.selecteType(1);
                  },
                  child: TypeTask(
                    color: Color(0xff5de61a),
                    type: 'Work',
                    isSelecte: dbProvider.isWork,
                  ),
                ),
                // SizedBox(
                //   width: 5,
                // ),
                GestureDetector(
                  onTap: () {
                    dbProvider.selecteType(2);
                  },
                  child: TypeTask(
                    color: Color(0xffd10263),
                    type: 'Meeting',
                    isSelecte: dbProvider.isMeeting,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    dbProvider.selecteType(5);
                  },
                  child: TypeTask(
                    color: Color(0xff3044f2),
                    type: 'Study',
                    isSelecte: dbProvider.isStudy,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    dbProvider.selecteType(3);
                  },
                  child: TypeTask(
                    color: Color(0xfff29130),
                    type: 'Shopping',
                    isSelecte: dbProvider.isShopping,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40.0, left: 20),
              child: GestureDetector(
                child: Text(
                  "Choose date",
                  style: TextStyle(
                    fontSize: 13,
                    color: Color(0xff404040),
                  ),
                ),
                onTap: () async {
                  dbProvider.time = await dbProvider.selectTime(context);
                  print(dbProvider.time);
                },
              ),
            ),
            SizedBox(
              height: 300,
            ),
            GestureDetector(
              child: SizedBox(
                width: 250,
                height: 60,
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xFF5DE61A).withOpacity(0.4),
                        Color(0xFF5DE61A).withOpacity(0.5),
                        Color(0xFF5DE61A).withOpacity(0.7),
                        Color(0xFF5DE61A),
                      ]),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(color: Colors.black54),
                      ],
                    ),
                    child: new Text(
                      "Add task",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Color(0xffffffff),
                      ),
                    )),
              ),

              // dbProvider.time == null
              //           ? ''
              //           : "${dbProvider.time.hour.toString()}" +
              //               ":"
              //                   "${dbProvider.time.minute.toString()}"
              onTap: () {
                Tasks tasks = Tasks(
                    isComplete: false,
                    date: dbProvider.time == null
                        ? ''
                        : "${dbProvider.time.day.toString()}" +
                            ":"
                                "${dbProvider.time.month.toString()}"
                                ':'
                                "${dbProvider.time.year.toString()}",
                    type: dbProvider.type,
                    title: _titleController.text);

                if (_titleController.text == null ||
                    _titleController.text == '') {
                  print('text empty');
                } else if (dbProvider.type == '' || dbProvider.type == null) {
                  print('type empty');
                } else if (dbProvider.time == null) {
                  print('time empty');
                } else {
                  dbProvider.insertNewTask(tasks);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
