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
            itemCount: dbProvider.tasks.length,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: ItemsListView(
                  id:dbProvider.tasks[index].id ,
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
                      dbProvider.deleteTasksById(dbProvider.tasks[index].id);
                    },
                  ),
                ],
              );
            });
      } else {
        return Center(child: Text('Prees + to add New Task'));
      }
    });
  }
}