import 'package:flutter/material.dart';
import 'dart:async';
import 'package:onlinedeliveryapp/home.dart';
import 'package:onlinedeliveryapp/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/animation.dart';

void main() => runApp(new MaterialApp(
//  home: new SplashScreen(),
  routes: <String, WidgetBuilder>{
    '/home': (BuildContext context) => new Home(),
    '/login': (BuildContext context) => new Login()
  },
));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  Animation animation;

  AnimationController animationController;

  startTime() async {
    var _duration = new Duration(seconds: 4);
    return new Timer(_duration, navigationPage);
  }

  Future<String> getNamePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String mobile = prefs.getString("mobile");
    return mobile;
  }

  var usermobile;
  var password;
  var _id;
  var user_name;
  String url = "https://dominosclone.herokuapp.com/api/login";

  void getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString('mobile');
    var pass = prefs.getString('password');
    setState(() {
      usermobile = mobile;
      password = pass;
    });
//    var map1 = {"mobile": usermobile, "password": password};
//    apiPost(url, map1);
    print(usermobile);
    print(password);
  }

  @override
  void initState() {
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 20.0,end: 150.0).animate(animationController);
    animationController.forward();

    animation.addListener((){
      setState(() {
        print(animationController.value.toString());
      });
    });
    getEmail();
    startTime();
    // print(map1);
//    loadDrop();
  }

//  var data;
//
//  Future<String> apiPost(String url, Map jsonMap) async {
//    try {
//      HttpClient httpClient = new HttpClient();
//      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
//      request.headers.set('content-type', 'application/json');
//      request.add(utf8.encode(json.encode(jsonMap)));
//
//      HttpClientResponse response = await request.close();
//
//      String replay = await response.transform(utf8.decoder).join();
//
//      httpClient.close();
//
//      setState(() {
//        var parsed = json.decode(replay);
//        data = parsed;
//        // print(data);
//      });
//
////      data=parsed;
//      //print(data);
//
////      return parsed;
//
//    } catch (error) {
//      print(error.toString());
//    }
//  }

  void navigationPage() async {
//    runApp(MaterialApp(home: usermobile == null ? Login() : Home(data: data),debugShowCheckedModeBanner: false,),);
//    Navigator.of(context).pushReplacementNamed('/login');
    if(usermobile==null)
    {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) {
            return new Login();
          }));
    }
    else
    {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (BuildContext context) {
            return new Home();
          }));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
          child: Container(
            height: animation.value,
            width: animation.value,
            child: new Image.asset(
              'assets/10.png',
              height: 150,
              width: 150,
            ),
          )),
    );
  }
}


