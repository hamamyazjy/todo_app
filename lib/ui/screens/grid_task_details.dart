import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/widgets/item_list_view.dart';

class GridTaskDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DbProvider dbProvider = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(' Tasks ${dbProvider.type}'),
      ),
      body: FutureBuilder<List<Tasks>>(
          future: dbProvider.setTaskByType(dbProvider.type),
          builder: (context, AsyncSnapshot asyncSnapshot) {
            if (asyncSnapshot.hasData) {
              List<Tasks> tasks = asyncSnapshot.data;
              if (tasks.length > 0) {
                return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Slidable(
                        actionPane: SlidableDrawerActionPane(),
                        actionExtentRatio: 0.25,
                        child: ItemsListView(
                          id: tasks[index].id,
                          title: tasks[index].title,
                          isComplete: tasks[index].isComplete,
                          type: tasks[index].type,
                          date: tasks[index].date,
                        ),
                        secondaryActions: <Widget>[
                          IconSlideAction(
                            iconWidget: Card(
                              shape: CircleBorder(
                                  side: BorderSide(color: Colors.red)),
                              child: Icon(
                                Icons.delete_forever,
                                color: Colors.red,
                              ),
                            ),
                            onTap: () {
                              dbProvider.deleteTasksById(tasks[index].id);
                            },
                          ),
                        ],
                      );
                    });
              } else {
                return Center(child: Text('Now Task ${dbProvider.type}'));
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
