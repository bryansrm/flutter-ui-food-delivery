import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.reemKufiTextTheme(
          Theme.of(context).textTheme
        )
      ),
      home: Scaffold(
        body: Center(
          child: Container(
            child: Text('Hello World nice friday', style: TextStyle(fontSize: 25),),
          ),
        ),
      ),
    );
  }
}