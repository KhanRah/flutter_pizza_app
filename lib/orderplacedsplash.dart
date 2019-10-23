import 'package:flutter/material.dart';
import 'dart:async';
import 'package:onlinedeliveryapp/home.dart';
import 'package:onlinedeliveryapp/LoginScreen.dart';
import 'package:onlinedeliveryapp/menu.dart';
import 'package:onlinedeliveryapp/myorders.dart';

void main() => runApp(new MaterialApp(
//  home: new SplashScreen(),
  routes: <String, WidgetBuilder>{
    '/myorders': (BuildContext context) => new myOrders(),
    '/home': (BuildContext context) => new Home()


  },
));

class OSplashScreen extends StatefulWidget {
  var userdata;
  OSplashScreen({Key key,@required this.userdata}):super(key:key);

  @override
  _OSplashScreenState createState() => new _OSplashScreenState();
}

class _OSplashScreenState extends State<OSplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 7);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return new myOrders();
    }));
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Center(
          child: Container(
             child:Column(
               children: <Widget>[
                 SizedBox(
                   height: 250,
                 ),
                 Image.asset("assets/13.gif",height: 200,width: 200,),
                 Text('Stay Relax Our Delivery Executive will call you.',style: TextStyle(fontWeight: FontWeight.bold),)
               ],
             )
          )),
    );
  }
}