import 'package:flutter/material.dart';
import 'package:wsu_go/consts.dart';
import 'package:wsu_go/screens/homePage.dart';

class StudentsClass extends StatefulWidget {
  @override
  _StudentsClassState createState() => _StudentsClassState();
}

class _StudentsClassState extends State<StudentsClass> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: shockerYellow,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                  ('Add your classes here'),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(
                      builder: (context){
                        return HomePage();
                      },
                    ),
                  );
                },
                child: Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
