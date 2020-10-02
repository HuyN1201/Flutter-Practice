//Imported necessary dart pages
import 'package:flutter/material.dart';
import 'screens/homePage.dart';
import 'screens/studentsClass.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Setting my home route
      initialRoute: 'homePage',
      //Setting all of my routes
      routes: {
        'homePage': (context) => HomePage(),
        'studentsClass': (context) => StudentsClass(),
      },
    );
  }
}
