import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/home.dart';
import 'package:onlinedeliveryapp/location.dart';
import 'package:onlinedeliveryapp/pickup.dart';
import 'package:onlinedeliveryapp/menu.dart';
import 'package:onlinedeliveryapp/xxxxxxxxxx.dart';
import 'package:onlinedeliveryapp/vegmenu.dart';
import 'package:onlinedeliveryapp/orderselection.dart';
import 'package:onlinedeliveryapp/Splash.dart';
import 'package:onlinedeliveryapp/LoginScreen.dart';
import 'package:onlinedeliveryapp/SignUp.dart';
import 'package:onlinedeliveryapp/editprofile.dart';
import 'package:onlinedeliveryapp/testcaeeee.dart';
import 'package:onlinedeliveryapp/myorders.dart';
import 'package:onlinedeliveryapp/Traindelivery.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dominos Pizza',
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new Home(),
        '/location': (BuildContext context) => new deliveryloction(),
        '/pickup': (BuildContext context) => new pickup(),
        '/menu': (BuildContext context) => new Menu(),
//        '/khan': (BuildContext context) => new khan(),
        '/order':(BuildContext context)=>new OrderSelection(),
        '/login':(BuildContext context)=>new Login(),
        '/signup':(BuildContext context)=>new SignUp(),
//        '/editprofile':(BuildContext context)=>new EditProfile()
      '/testcase':(BuildContext context)=> new toppins(),
        '/myorders': (BuildContext context) => new myOrders(),
        '/mytrainorders': (BuildContext context) => new deliverOnTrain()

      },
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}
