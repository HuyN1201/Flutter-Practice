import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color shockerYellow = const Color(0xFFFFCD00);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: shockerYellow,
        body: SafeArea(
          child: Container(
            child: Align(
              alignment: FractionalOffset(0.04, 0.24),
              child: Text(
                'Good morning,\nVariable',
                textDirection: TextDirection.ltr,
                textAlign: TextAlign.left,
                style: GoogleFonts.josefinSans(
                    textStyle:
                        TextStyle(fontSize: 60, fontWeight: FontWeight.w500)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
