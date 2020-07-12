import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/db_provider.dart';
import 'package:todo_app/ui/screens/on_boarding_screes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DbProvider>(
      create: (context) => DbProvider(),
      child: MaterialApp(
        home: OnBoarding(),
      ),
    );
  }
}
