import 'package:flutter/material.dart';
import 'package:ownerapp/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: Scaffold(
         appBar: AppBar(title: Text('Fire Base'),),
         body: Home(),
       ),
    );
  }
}
