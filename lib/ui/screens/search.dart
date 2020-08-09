import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/tasks.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/repo/repository.dart';
import 'package:todo_app/ui/widgets/item_list_view.dart';

class Search extends StatelessWidget {
  String search;
  @override
  Widget build(BuildContext context) {
    DbProvider dbProvider = Provider.of<DbProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextFormField(
              // controller: _searchController,
              onChanged: (value) async {
                search = value;
                await dbProvider
                    .setTasksByNameWithLike(search == '' ? '' : '$search%');
              },
              decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  )),
            ),
            SizedBox(height: 10),
            Expanded(
              child: FutureBuilder<List<Tasks>>(
                future: dbProvider
                    .setTasksByNameWithLike(search == '' ? '' : '$search%'),
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
                      return Center(child: Text('No Task '));
                    }
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
