import 'package:flutter/material.dart';
import 'package:todo_app/ui/screens/home.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Image(image: ExactAssetImage('assets/images/onBoarding.png')),
            SizedBox(
              height: 30,
            ),
            Text(
              "Reminders made simple",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Rubik",
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Color(0xff554e8f),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris pellentesque erat in blandit luctus.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Open Sans",
                fontSize: 17,
                color: Color(0xff82a0b7),
              ),
            ),
            SizedBox(
              height: 120,
            ),
            GestureDetector(
              child: Container(
                width: 240,
                height: 60,
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
                child: Text(
                  "Get Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Open Sans",
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Color(0xfffcfcfc),
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
