import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

enum MyDialogAction { Yes, No, Maybe }

class _SignUpState extends State<SignUp> {
  String _password;
  String _mobile;
  String _user;
  String errmsg=" ";


  String url = "https://dominosclone.herokuapp.com/api/register";
  TextEditingController _userdata = new TextEditingController();
  TextEditingController _pass = new TextEditingController();
  TextEditingController _emaildata = new TextEditingController();

// String _username;
//  FormType _formType=FormType.login;
  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
//      _showAlert();
      form.save();
      return true;
    }

    return false;
  }

  Future<String> apiPost(String url, Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));

      HttpClientResponse response = await request.close();

      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      if(response.statusCode!=200)
        {
          setState(() {
            errmsg=replay;
          });
        }
        else
          {
            _showAlert();
          }

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
          "user_name": _user,
          "mobile": _mobile,
          "password": _password,
        };
        //  FirebaseUser user = await FirebaseAuth.instance
        //   .signInWithEmailAndPassword(email: _email, password: _user);
        print(map1);
        apiPost(url, map1);
        // print('Signed  in as:$user.uid');
//        else{
//          FirebaseUser user = await FirebaseAuth.instance
//              .createUserWithEmailAndPassword(email: _email, password: _user);
        //  print('Registered as:$user.uid');
//        }
      } catch (e) {
        print(e.toString());
      }
    }
  }

  final _formKey = GlobalKey<FormState>();

  void _dialogResult(MyDialogAction value) {
    print('You Selected $value');
    Navigator.of(context).pushNamed('/login');
  }

  _showAlert() {
    AlertDialog dialog = new AlertDialog(
      content: Container(
//        color: Colors.blue[900],
        child: Row(
          children: <Widget>[
            Text('Click Here to'),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.green),
              ),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, barrierDismissible: false, child: dialog);
  }

  String s = '';

  bool validation(String at) {
    if (at.startsWith(new RegExp(r'[0-5]')))
      return true;
    else if (at.length < 10)
      return true;
    else if (at.length > 10)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Signup'),
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.asset('assets/11.jpeg'),
            Container(
              padding: EdgeInsets.all(7.0),
              child: Card(
                elevation: 6.0,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: 500,
//                    height: 200,
                        padding: EdgeInsets.all(15.0),
                        child: new Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'SIGNUP HERE',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Name';
                                    } else if (value.startsWith(RegExp(r'[a-z]'))) {
                                      return 'Please Enter Valid Name with Capital letter First';
                                    } else if (value.length < 6) {
                                      return 'Name Must Contain Atleast 6 Characters';
                                    }
                                  },
                                  decoration:
                                  InputDecoration(hintText: '*Enter Name'),
                                  onSaved: (value) => _user = value,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please Enter Number';
                                    } else if (value.startsWith(RegExp(r'[0-5]'))) {
                                      return 'Please Enter Valid Number';
                                    } else if (value.length < 10) {
                                      return 'Please Enter Valid 10-digit Number';
                                    } else if (value.length > 10) {
                                      return 'Please Enter Valid 10-digit Number';
                                    }
                                  },
                                  keyboardType: TextInputType.number,
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
                                    } else if (value.length < 6) {
                                      return 'Password Must Contain Atleast 6 Characters';
                                    }
//                                  else if(value!=value)
//                                  {
//                                    return 'Password Must Contain Same';
//                                  }
                                  },
                                  decoration:
                                  InputDecoration(hintText: '*Enter Password'),
                                  onSaved: (value) => _password = value,
                                ),
//                              TextFormField(
//                                validator: (value) {
//
//                                if(value!=value)
//                                  {
//                                    return 'Password Must Contain Same';
//                                  }
//                                },
//                                decoration:
//                                InputDecoration(hintText: '*Confirm Password'),
//                                onSaved: (value) => _password=value,
//                              ),
                                SizedBox(
                                  height: 15.0,
                                ),
                                Text(errmsg,style: TextStyle(color: Colors.red),),
                                RaisedButton(
                                  onPressed: validateAndSubmit,
//                              Navigator.of(context).pushNamed('/login');

                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.lightGreen[800],
                                )
                              ],
                            )),
                      ),
                    ],
                  )),
            )
          ],
        ),
      ),
    );
    ;
  }
}
