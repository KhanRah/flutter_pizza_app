import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';
//class hasg extends StatefulWidget {
//  @override
//  _hasgState createState() => _hasgState();
//}
//
//class _hasgState extends State<hasg> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Column(
//        children: <Widget>[Text('khan'),
//      Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),Text('khan'),],
//      ),
//    );
//  }
//}
//class SecondPage extends StatefulWidget {
//  int count = 1;
//  bool isMultiSelectStarted = true;
//
//  final Function multiSelect;
//
//  SecondPage(this.multiSelect);
//
//  @override
//  _SecondPageState createState() => new _SecondPageState();
//}
//
//class _SecondPageState extends State<SecondPage> {
//  @override
//  Widget build(BuildContext context) {
//    return new Center(
//      child: new RaisedButton(
//        child: new Text('Pass data to MainPage'),
//        onPressed: () {
//          widget.multiSelect(widget.count, widget.isMultiSelectStarted);
//        },
//      ),
//    );
//  }
//}

class ApiProvider{
  ApiProvider();

  String endpoint='https://pizzaservertest.herokuapp.com';

  Future<http.Response>doLogin(String username,String email,String password) async
  {
    String _url='$endpoint/api/register';
    var body={
      "user_name":username,
      "email":email,
      "password":password,
    };
    print(username);
    print(email);
    print(password);

    return http.post(_url,body: body);
  }


}
