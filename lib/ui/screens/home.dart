import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/screens/home_task.dart';
import 'package:todo_app/ui/screens/search.dart';
import 'package:todo_app/ui/widgets/add_new_task.dart';

import 'grid_task.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  List body = [HomeTask(), GridTask()];

  @override
  Widget build(BuildContext context) {
    DbProvider dbProvider = Provider.of<DbProvider>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "ToDo",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Color(0xffffffff),
            ),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Search())))
          ],
        ),
        body: FutureBuilder<List<Tasks>>(
            future: dbProvider.setAllTasks(),
            builder: (context, AsyncSnapshot asyncSnapshot) {
              if (asyncSnapshot.hasData) {
                return body[index];
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => AddNewTask()));
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            onTap: (newIndex) {
              index = newIndex;
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  title: Text(
                    "Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Rubik",
                      fontWeight: FontWeight.w500,
                      fontSize: 10,
                      color: Color(0xff9f9f9f),
                    ),
                  )),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                title: Text(
                  "Task",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Rubik",
                    fontWeight: FontWeight.w500,
                    fontSize: 10,
                    color: Color(0xff9f9f9f),
                  ),
                ),
              )
            ]),
      ),
    );
  }
}
