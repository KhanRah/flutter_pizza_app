import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}



class _EditProfileState extends State<EditProfile> {
  String reply=" ";
  String _password;
  var data;
  String id;
  String _mobile;
  String _user;
  String url = "https://dominosclone.herokuapp.com/api/userupdate";


  bool validateAndSave() {
    _showSnackBar();
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }

    return false;

  }

  Future<String> apiPost(String url, Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.putUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));

      HttpClientResponse response = await request.close();

      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      print(replay);
      data=replay;
      return replay;
    } catch (error) {
      print(error.toString());
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        var map1 = {
          "_id":_id,
          "user_name": _user,
          "mobile": _mobile,
//          "password": _password,
        };
        apiPost(url, map1);
        print(map1);
      } catch (e) {
        print(e.toString());
      }
    }
  }

  var usermobile;
  var password;
  var _id;
  var user_name;

  void getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance( );
    var mobile = prefs.getString( 'mobile' );
    var pass = prefs.getString( 'password' );
    var username = prefs.getString( 'user_name' );
    var id = prefs.getString( '_id' );

    setState( () {
      usermobile = mobile;
      password = pass;
      user_name = username;
      _id = id;
    } );
  }

  final _formKey = GlobalKey<FormState>();

  TextEditingController namez = new TextEditingController();
  TextEditingController mobile = new TextEditingController();
//  final GlobalKey <ScaffoldState> _scaffoldState=new GlobalKey<ScaffoldState>();

  _showSnackBar()
  {
        new SnackBar(backgroundColor: Colors.blueAccent,content: Text(reply));
  }


@override
  void initState() {
      getData();
    // TODO: implement initState
    super.initState();
  }

  getData() async
  {
    var user=await getEmail();
    id=_id;
    namez.text=user_name;
    mobile.text=usermobile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit my Info'),
        backgroundColor: Colors.blue[900],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(top: 15.0),
          child: Card(
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
                              controller:namez ,
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
                              controller: mobile,
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
//                            TextFormField(
//                              obscureText: true,
//                              validator: (value) {
//                                if (value.isEmpty) {
//                                  return 'Please Enter Password';
//                                } else if (value.length < 6) {
//                                  return 'Password Must Contain Atleast 6 Characters';
//                                }
////                                  else if(value!=value)
////                                  {
////                                    return 'Password Must Contain Same';
////                                  }
//                              },
//                              decoration:
//                              InputDecoration(hintText: '*Enter Password'),
//                              onSaved: (value) => _password = value,
//                            ),
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
        ),
      ),
    );
  }
}
