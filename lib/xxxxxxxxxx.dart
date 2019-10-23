import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/testcaeeee.dart';
import 'package:onlinedeliveryapp/testcase.dart';
////class test extends StatefulWidget {
////  @override
////  _testState createState() => _testState();
////}
////
////class _testState extends State<test> {
////  int selectedRadio;
////  setSelectedRadio(value)
////  {
////    setState(() {
////      selectedRadio=value;
////      print(value);
////    });
////  }
////  @override
////  Widget build(BuildContext context) {
////    return Scaffold(
////      appBar: AppBar(
////        title: Text('Test Cases'),
////      ),
////      body: Column(
////          children: <Widget>[
////            new Radio(
////              activeColor: Colors.blue[900],
////              value: 2,
////              groupValue: selectedRadio,
////              onChanged: (val)
////              {
////                setSelectedRadio(val);
////              },
////
////            ),
////            new Radio(
////              activeColor: Colors.blue[900],
////              value: 1,
////              groupValue: selectedRadio,
////              onChanged: (val)
////              {
////                setSelectedRadio(val);
////              },
////
////            ),
////        ],
////
////      ),
////    );
////  }
////}
//import 'package:flutter/material.dart';
//class test extends StatefulWidget {
//  @override
//  _testState createState() => _testState();
//}
//
//class _testState extends State<test> {
//  @override
//  Widget build(BuildContext context) {
//    final TextEditingController _controller = new TextEditingController();
//    var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
//    return Scaffold(
//      appBar: new AppBar(title: const Text('Drop List Example')),
//      body: new Center(
//        child: new Container(
//          child: new Column(
//            children: [
//              new Padding(
//                padding: const EdgeInsets.all(24.0),
//                child: new Row(
//                  children: <Widget>[
//                    new Expanded(
//                        child: new TextField(controller: _controller)
//                    ),
//                    new PopupMenuButton<String>(
//                      icon: const Icon(Icons.arrow_drop_down),
//                      onSelected: (String value) {
//                        _controller.text = value;
//                      },
//                      itemBuilder: (BuildContext context) {
//                        return items.map<PopupMenuItem<String>>((String value) {
//                          return new PopupMenuItem(child: new Text(value), value: value);
//                        }).toList();
//                      },
//                    ),
//                  ],
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//Container(
//padding: EdgeInsets.all(20.0),
//height: 200.0,
//child: ListView(
//scrollDirection: Axis.horizontal,
//children: <Widget>[
//Container(
//width: 160.0,
//color: Colors.red,
//),
//Container(
//width: 160.0,
//color: Colors.blue,
//),
//Container(
//width: 160.0,
//color: Colors.green,
//),
//Container(
//width: 160.0,
//color: Colors.yellow,
//),
//Container(
//width: 160.0,
//color: Colors.orange,
//),
//]
//),
//),
//import 'package:flutter/material.dart';
//
//class NavToNewPageDrawer extends StatelessWidget {
//  static final List<String> _listViewData = [
//    "Inducesmile.com",
//    "Flutter Dev",
//    "Android Dev",
//    "iOS Dev!",
//    "React Native Dev!",
//    "React Dev!",
//    "express Dev!",
//    "Laravel Dev!",
//    "Angular Dev!",
//  ];
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Navigate to new Screens Drawer Example"),
//      ),
//      drawer: Drawer(
//        child: Align(
//          alignment: Alignment.bottomCenter,
//          child: Container(
//            child: ListView(padding: EdgeInsets.all(10.0), children: [
//              ListTile(
//                title: Text("Go to First Screen"),
//                onTap: () {
//                  Navigator.of(context).push(
//                      MaterialPageRoute<Null>(builder: (BuildContext context) {
//                        return new FirstScreen();
//                      }));
//                },
//              ),
//              ListTile(
//                title: Text("Go to Second Screen"),
//                onTap: () {
//                  Navigator.of(context).push(
//                      MaterialPageRoute<Null>(builder: (BuildContext context) {
//                        return new SecondScreen();
//                      }));
//                },
//              )
//            ]),
//          ),
//        ),
//      ),
//      body: Center(
//        child: Text('Main Body'),
//      ),
//    );
//  }
//}
//
//class FirstScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("First Screen"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          color: Colors.red,
//          child: Text("Go Back"),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//      ),
//    );
//  }
//}
//
//class SecondScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Screen"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          color: Colors.red,
//          child: Text("Go Back"),
//          onPressed: () {
//            Navigator.of(context).pop();
//          },
//        ),
//      ),
//    );
//  }
////}
//class khan extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child:ListView(
//        children: <Widget>[
//          Text('Kahn'),
//          Text('Kahn'),
//
//          Text('Kahn'),
//
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//          Text('Kahn'),
//
//        ],
//      )
//    );
//  }
//}
//class Menuxx extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      home: DefaultTabController(
//        length: choices.length,
//        child: Scaffold(
//          appBar: AppBar(
//            title: const Text('Explore Menu'),
//            bottom: TabBar(
//              isScrollable: true,
//              tabs: choices.map((Choice choice) {
//                return Tab(
//                  text: choice.title,
//                  icon: Icon(choice.icon),
//                );
//              }).toList(),
//            ),
//          ),
//          body: TabBarView(
//            children: choices.map((Choice index) {
//              return Padding(
//                padding: const EdgeInsets.all(16.0),
//                child: ChoiceCard(index: index),
//              );
//            }).toList(),
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//class Choice {
//  const Choice({this.title, this.icon});
//
//  final String title;
//  final IconData icon;
//}
//
//const List<Choice> choices = const <Choice>[
//  const Choice(title: 'CAR'),
//  const Choice(title: 'BICYCLE'),
//  const Choice(title: 'BOAT'),
//  const Choice(title: 'BUS'),
//  const Choice(title: 'TRAIN'),
//  const Choice(title: 'WALK'),
//];
//
//class ChoiceCard extends StatelessWidget {
//  const ChoiceCard({Key key, this.index}) : super(key: key);
//
//  final Choice index;
//
//  @override
//  Widget build(BuildContext context) {
//    final TextStyle textStyle = Theme.of(context).textTheme.display1;
//    return Card(
//      color: Colors.white,
//      child: Center(
//        child: Column(
//          mainAxisSize: MainAxisSize.min,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//
//          ],
//        ),
//      ),
//    );
//  }
//}
//class MainPage extends StatefulWidget {
//  @override
//  _MainPageState createState() => new _MainPageState();
//}
//
//class _MainPageState extends State<MainPage> {
//  int count = 0;
//  bool isMultiSelectStarted = false;
//
//  void onMultiSelectStarted(int count, bool isMultiSelect) {
//    print('Count: $count  isMultiSelectStarted: $isMultiSelect');
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        backgroundColor: Colors.blue,
//        title: new Text('Home'),
//      ),
//      body: new Center(
//        child: new RaisedButton(
//          child: new Text('Go to SecondPage'),
//          onPressed: () {
//            Navigator.of(context).push(
//              new MaterialPageRoute(
//                builder: (context) {
//                  return new SecondPage(onMultiSelectStarted);
//                },
//              ),
//            );
//          },
//        ),
//      ),
//    );
//  }
//}

//import 'dart:async';
//import 'dart:convert';
//import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
//import 'package:onlinedeliveryapp/testcase.dart';
//
//
//
//
//class Hello extends StatelessWidget {
//
//
//  static final CREATE_POST_URL = 'https://fluttertestserver.herokuapp.com/login';
//  TextEditingController titleControler = new TextEditingController();
//  TextEditingController bodyControler = new TextEditingController();
//  TextEditingController psControler = new TextEditingController();
//
//  final _formKey= GlobalKey<FormState>();
//
//
//  ApiProvider apiProvider=ApiProvider();
//
//  Future doLogin() async
//  {
//    if(_formKey.currentState.validate()){}
//    try{
//      var rs = await apiProvider.doLogin(titleControler.text, psControler.text, bodyControler.text);
//      if(rs.statusCode==201){
////        print(rs.body);
//        var jsonRes = json.decode(rs.body);
//        if(jsonRes['ok'])
//          {
//            String token =jsonRes['token'];
//            print(token);
//          }else{
//          print(jsonRes['error']);
//        }
//      }else{
//        print('server error');
//      }
//
//    }catch(error){
//      print(error);
//    }
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return MaterialApp(
//      title: "WEB SERVICE",
//      theme: ThemeData(
//        primaryColor: Colors.deepOrange,
//      ),
//      home: Scaffold(
//          appBar: AppBar(
//            title: Text('Create Post'),
//          ),
//          body: new Container(
//            margin: const EdgeInsets.only(left: 8.0, right: 8.0),
//            child: new Column(
//              children: <Widget>[
//               Container(
//                 child: Form(
//                   key:_formKey,
//                     child: Column(
//                   children: <Widget>[
//                     new TextFormField(
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                       },
//                       controller: titleControler,
//                       decoration: InputDecoration(
//                           hintText: "title....", labelText: 'Post Title'),
//                     ),
//                     new TextFormField(
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                       },
//                       controller: psControler,
//                       decoration: InputDecoration(
//                           hintText: "body....", labelText: 'Post Body'),
//                     ),
//                     new TextFormField(
//                       validator: (value) {
//                         if (value.isEmpty) {
//                           return 'Please enter some text';
//                         }
//                       },
//                       controller: bodyControler,
//                       decoration: InputDecoration(
//                           hintText: "body....", labelText: 'Post Body'),
//                     ),
//                     new RaisedButton(
//                            onPressed: ()=>doLogin(),
//                       child: const Text("Create"),
//                     )
//                   ],
//                 )),
//               )
//              ],
//            ),
//          )),
//    );
//  }
//}
import 'dart:io';

import 'package:flutter/material.dart';
//import 'contact.dart';
import 'dart:convert';
import 'dart:async';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart';
class MyCustomForm extends StatefulWidget {


  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

enum FormType{
  login,
  register
}
// Create a corresponding State class. This class will hold the data related to
// the form.
class MyCustomFormState extends State<MyCustomForm> {
   String _password;
   String _email;
   String _user;

  String url="https://dominosclone.herokuapp.com/api/register";
  TextEditingController _userdata= new TextEditingController();
  TextEditingController _pass= new TextEditingController();
  TextEditingController _emaildata= new TextEditingController();
// String _username;
  FormType _formType=FormType.login;
  bool validateAndSave(){
    final form=_formKey.currentState;
    if(form.validate()){
      form.save();
      return true;
    }

    return false;
  }




  Future<String> apiPost(String url,Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));

      HttpClientResponse response = await request.close();

      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      print(replay);
      return replay;
    }

    catch (error) {
      print(error.toString());
    }
  }


  void validateAndSubmit() async{
    if(validateAndSave()){
      try {
        if(_formType==FormType.login) {
          var map1={
            "user_name": _user,
            "email": _email,
            "password": _password,
          };
          //  FirebaseUser user = await FirebaseAuth.instance
          //   .signInWithEmailAndPassword(email: _email, password: _user);
          print(map1);
          apiPost(url, map1);
          // print('Signed  in as:$user.uid');
        }else{
//          FirebaseUser user = await FirebaseAuth.instance
//              .createUserWithEmailAndPassword(email: _email, password: _user);
          //  print('Registered as:$user.uid');
        }
      }
      catch(e){
        print(e.toString());
      }
    }
  }

  void moveToRegister(){
    _formKey.currentState.reset();
    setState(() {
      _formType=FormType.register;
    });

  }

  void moveToLogin(){
    _formKey.currentState.reset();
    setState(() {
      _formType=FormType.login;
    });
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey we created above
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.redAccent,
          title: new  Row(
              children:<Widget>[
                SizedBox(width: 100,),
                IconButton(icon: Image.asset('assets/logo.png',fit: BoxFit.cover,width: 100,height: 100,),color: Colors.white70,alignment: Alignment.center,iconSize: 200,onPressed: null,)
              ]),

        ),

        body:  Container(
          padding: EdgeInsets.all(20),

          child: new Form(
            key: _formKey,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children:
                inputFields()+submitButtons()


            ),

          ),
        )
    );

  }
  List<Widget> inputFields(){

    return[

      new TextFormField(
        decoration: new InputDecoration(labelText: 'Name *',),
        keyboardType: TextInputType.text,
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _user=value,
        controller: _userdata,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'password *',),
        keyboardType: TextInputType.text,
        validator: (value) => value.isEmpty ? 'Number can\'t be empty' : null,
        onSaved: (value) =>_password=value,
        controller: _pass,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Email *',),
        keyboardType: TextInputType.emailAddress,
        validator: (value) => value.isEmpty ? 'email can\'t be empty' : null,
        onSaved: (value) => _email=value,
        controller: _emaildata,
      ),
    ];

  }

  List<Widget> submitButtons(){
    if(_formType==FormType.login){
      return [
        new RaisedButton(child: Text('login',style: TextStyle(fontSize: 20),),
            onPressed: validateAndSubmit),

        new FlatButton(onPressed: moveToRegister, child: new Text('new user Create Account',
          style: TextStyle(fontSize: 20,color: Colors.blue),))
      ];}

    else{
      return [
        new RaisedButton(child: Text('Register',style: TextStyle(fontSize: 20),),
            onPressed: validateAndSubmit),

        new FlatButton(onPressed: moveToLogin, child: new Text('Have an Account Login',
          style: TextStyle(fontSize: 20,color: Colors.blue),))
      ];}
  }
}