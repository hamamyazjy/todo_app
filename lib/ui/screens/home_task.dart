import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/widgets/item_list_view.dart';

class HomeTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // DbProvider db = Provider.of<DbProvider>(context);

    return Consumer<DbProvider>(builder: (context, dbProvider, widget) {
      if (dbProvider.tasks.length > 0) {
        return ListView.builder(
            padding: EdgeInsets.all(15),
            itemCount: dbProvider.tasks.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ItemsListView(
                  id: dbProvider.tasks[index].id,
                  title: dbProvider.tasks[index].title,
                  isComplete: dbProvider.tasks[index].isComplete,
                  type: dbProvider.tasks[index].type,
                  date: dbProvider.tasks[index].date,
                ),
                secondaryActions: <Widget>[
                  IconSlideAction(
                    iconWidget: Card(
                      shape: CircleBorder(side: BorderSide(color: Colors.red)),
                      child: Icon(
                        Icons.delete_forever,
                        color: Colors.red,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Warning'),
                              content: Text(
                                  'Sure delete ${dbProvider.tasks[index].title}'),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      dbProvider.deleteTasksById(
                                          dbProvider.tasks[index].id);
                                      Navigator.pop(context);
                                    },
                                    child: Text('Yes')),
                                FlatButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text('No')),
                              ],
                            );
                          });
                    },
                  ),
                ],
              );
            });
      } else {
        return Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/noTask.png'),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'No tasks',
              style: TextStyle(fontSize: 20, color: Color(0xff554e8f)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Prees + to add New Task',
              style: TextStyle(fontSize: 15),
            ),
          ],
        ));
      }
    });
  }
}
