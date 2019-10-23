import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/home.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_offline/flutter_offline.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldState =
      new GlobalKey<ScaffoldState>();

  final FirebaseMessaging _messaging = FirebaseMessaging();
  @override
  var token;

  void initState() {
    token = _messaging.getToken().then((token) {
      print(token);
    });
    _checkInternetConnection();
    // TODO: implement initState
    super.initState();
  }

  var name;
  String number;
  String _password;
  String _mobile;
  String error = '';
  String url = "https://dominosclone.herokuapp.com/api/login";

  bool validateAndSave() {
    final form = _loginKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  Future<String> apiLogin(String url, Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));

      HttpClientResponse response = await request.close();

      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      var parsed = json.decode(replay);
      name = parsed;
      if (response.statusCode == 200) {
        var bool_s = await saveNamePrefrences(
          name['_id'],
          name['user_name'],
          name['mobile'],
          name['password'],
        );
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (BuildContext context) {
          return new Home();
        }));
      } else {
        setState(() {
          error = replay;
        });
      }
      print(parsed);
      print(replay);
      return replay;
    } catch (error) {
      print(error.toString());
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var map1 = {
          "mobile": _mobile,
          "password": _password,
        };
        print(map1);
        apiLogin(url, map1);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  int time;

  _checkInternetConnection() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          time = 10;
          _showSnackBar('Please Check Internet Connection');
          if (result == ConnectivityResult.none) {
            setState(() {
              _showSnackBar('Please Check Internet Connection');
            });
          }
        });
      }
    });
  }

  _showSnackBar(String value) {
    print(value);
    if (value.isEmpty) return;
    _scaffoldState.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.blue[900],
      content: Text(
        value,
        style: TextStyle(color: Colors.white),
      ),
      duration: new Duration(seconds: time),
    ));
  }



  Future<bool> saveNamePrefrences(_id, user_name, mobile, password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("_id", _id);
    prefs.setString("user_name", user_name);
    prefs.setString("mobile", mobile);
    prefs.setString("password", password);
    return true;
  }

  final _loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldState,
        body: Container(
          padding: EdgeInsets.all(5.0),
          child: ListView(
            children: <Widget>[
//              DemoPage(),
              Image.asset('assets/11.jpeg'),
              Card(
                  elevation: 10.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 500,
//                    height: 200,
                        padding: EdgeInsets.all(15.0),
                        child: Form(
                          key: _loginKey,
                          child: Column(
                            children: <Widget>[
                              Text(
                                'LOGIN WITH YOUR VALID MOBILE NUMBER',
                                style: TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Number';
                                  }
                                },
                                decoration:
                                    InputDecoration(hintText: '*Mobile Number'),
                                onSaved: (value) => _mobile = value,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please Enter Password';
                                  }
                                },
                                decoration:
                                    InputDecoration(hintText: '*Password'),
                                onSaved: (value) => _password = value,
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              new Text(
                                error,
                                style: TextStyle(color: Colors.red),
                              ),
                              RaisedButton(
                                onPressed: validateAndSubmit,
//                    Navigator.of(context).pushNamed('/home');

                                child: Text(
                                  'Submit',
                                  style: TextStyle(color: Colors.white),
                                ),
                                color: Colors.lightGreen[800],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 10.0,
              ),
              Card(
                  elevation: 10.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 500,
//                    height: 200,
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'LOGIN WITH SOCIAL ACCOUNTS',
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                RaisedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Image.network(
                                        'http://pngimg.com/uploads/facebook_logos/facebook_logos_PNG19750.png',
                                        height: 27,
                                        width: 36,
                                      ),
                                      Text(
                                        'FACEBOOK',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  color: Colors.blue[700],
                                ),
                                RaisedButton(
                                  onPressed: () {},
                                  child: Row(
                                    children: <Widget>[
                                      Image.network(
                                        'http://pngimg.com/uploads/gmail_logo/gmail_logo_PNG9.png',
                                        height: 27,
                                        width: 36,
                                      ),
                                      Text(
                                        'GOOGLE',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  color: Colors.red[700],
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 5.0,
              ),
              Card(
                  elevation: 6.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 500,
//                    height: 200,
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              child: Text(
                                'SIGNUP HERE',
                                style: TextStyle(color: Colors.grey),
                              ),
                              padding: EdgeInsets.all(6.0),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FlatButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/signup');
                              },
                              child: Text(
                                'SIGNUP',
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}


class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          return new Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                height: 24.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  color: connected ? Color(0xFF00EE44) : Color(0xFFEE4400),
                  child: Center(
                    child: Text("${connected ? 'ONLINE' : 'OFFLINE'}"),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
