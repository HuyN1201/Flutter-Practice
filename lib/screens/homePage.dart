import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wsu_go/consts.dart';
import 'package:wsu_go/screens/studentsClass.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                'Good morning,\nVariable',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: GoogleFonts.josefinSans(
                    textStyle:
                    TextStyle(fontSize: 60, fontWeight: FontWeight.w500)),
              ),
              RaisedButton(
                onPressed: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context){
                          return StudentsClass();
                        },
                      ),
                  );
                },
                child: Text(
                    ('Add Class'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
