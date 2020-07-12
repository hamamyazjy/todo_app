import 'package:flutter/material.dart';

class NoTask extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(
            width: 300,
            height: 300,
            child: Image(image: ExactAssetImage('assets/images/noTask.png'))),
        SizedBox(height: 15),
        Text(
          "No tasks",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Rubik",
            fontWeight: FontWeight.w500,
            fontSize: 22,
            color: Color(0xff554e8f),
          ),
        ),
        SizedBox(height: 15),
        Text(
          "You have no task to do.",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: "Open Sans",
            fontSize: 17,
            color: Color(0xff82a0b7),
          ),
        )
      ],
    );
  }
}
