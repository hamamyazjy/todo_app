import 'package:flutter/material.dart';

class TypeTask extends StatelessWidget {
  final Color color;
  final String type;
  final bool isSelecte;
  TypeTask({this.color, this.type, this.isSelecte});
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isSelecte ? Colors.green : Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 10.00,
            width: 10.00,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(
            width: 2,
          ),
          Text(
            type,
            style: TextStyle(
              fontSize: 15,
              color: Color(0xff8e8e8e),
            ),
          )
        ],
      ),
    );
  }
}
