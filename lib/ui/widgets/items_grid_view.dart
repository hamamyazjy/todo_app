import 'package:flutter/material.dart';
import 'package:todo_app/models/item_tasks.dart';

class ItemsGridView extends StatelessWidget {
  ItemTask itemsTask;

  ItemsGridView({this.itemsTask});
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      height: 180.49,
      width: 159.93,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0.00, 7.00),
            color: Color(0xffbbbbbb).withOpacity(0.35),
            blurRadius: 11,
          ),
        ],
        borderRadius: BorderRadius.circular(5.00),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 65.11,
            width: 65.11,
            decoration: BoxDecoration(
              color: itemsTask.color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              itemsTask.icon,
              size: 35,
              color: itemsTask.color,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            itemsTask.typeTitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Color(0xff686868),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Text(
          //   "${itemsTask.numberTotal} Task",
          //   style: TextStyle(
          //     fontSize: 8,
          //     color: Color(0xffa1a1a1),
          //   ),
          // )
        ],
      ),
    ));
  }
}
