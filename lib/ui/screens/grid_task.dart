import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/models/item_tasks.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/screens/grid_task_details.dart';
import 'package:todo_app/ui/widgets/items_grid_view.dart';

class GridTask extends StatelessWidget {
  List<ItemTask> itemsTask = [
    ItemTask(
        typeTitle: 'Personal',
        icon: Icons.person,
        numberTotal: 24,
        color: Color(0xffffee9b)),
    ItemTask(
        typeTitle: 'Work',
        icon: FontAwesomeIcons.briefcase,
        numberTotal: 24,
        color: Color(0xffb5ff9b)),
    ItemTask(
        typeTitle: 'Meeting',
        icon: FontAwesomeIcons.handshake,
        numberTotal: 24,
        color: Color(0xffff9bcd)),
    ItemTask(
        typeTitle: 'Shopping',
        icon: FontAwesomeIcons.shoppingBasket,
        numberTotal: 24,
        color: Color(0xffffd09b)),
    ItemTask(
        typeTitle: 'Party',
        icon: FontAwesomeIcons.gifts,
        numberTotal: 24,
        color: Color(0xff9bfff8)),
    ItemTask(
        typeTitle: 'Study',
        icon: FontAwesomeIcons.university,
        numberTotal: 24,
        color: Color(0xfff59bff)),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: itemsTask.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          child: ItemsGridView(
            itemsTask: itemsTask[index],
          ),
          onTap: () {
            Provider.of<DbProvider>(context, listen: false).selecteType(index);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => GridTaskDetails()));
          },
        );
      },
    );
  }
}
