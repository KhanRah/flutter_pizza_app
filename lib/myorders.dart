import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/home.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class myOrders extends StatefulWidget {

  @override
  _myOrdersState createState() => _myOrdersState();
}

class _myOrdersState extends State<myOrders> {
  String url = "https://dominosclone.herokuapp.com/api/userorders";


  @override
  void initState() {
    super.initState();
    getOrders();
  }



  var usermobile;
  var password;
  var _id;
  var user_name;

  Future <String> getEmail() async {
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

    return usermobile;
  }


  void getOrders() async
  {
    var user=await getEmail();
    var map1 = {
      "mobile": user,
    };
    print(usermobile);
    this.apiPost(url, map1);
  }
  var data = [];

  Future<String> apiPost(String url, Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
      HttpClientResponse response = await request.close();
      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      setState(() {
        var parsed = json.decode(replay);
        data = parsed;
      });
      print(data);
    } catch (error) {
      print(error.toString());
    }
  }

  void _showAlert(String text) {

    if (text.isEmpty) return;

    AlertDialog dialog = new AlertDialog(
      content: new Text(
        text,
        style: TextStyle(
          fontSize: 15.0,
        ),
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              //moveToLogin();
              Navigator.pop(context);
            },
            child: new Text('Okay'))
      ],
    );

    showDialog(context: context,child: dialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.arrow_back),
              onTap: () {
                Navigator
                    .of(context)
                    .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
                  return new Home();
                }));
              },
            ),
            SizedBox(
              width: 15.0,
            ),
            Text('Order History')
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
      ),
      body: orders(),
    );
  }

  Widget orders() {
    if (data.length == 0) {
      return new Center(
        child: Text(
          'Here are Your  orders',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      );
    } else
      return new ListView.builder(
          itemCount: data == null ? 0 : data.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                padding: EdgeInsets.all(3.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(5.0),
                    ),
                    GestureDetector(
                      child: Card(
                        elevation: 5.0,
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Order Id: ',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(data[index]['_id']
                                        .toString()
                                        .substring(10, 24))
                                  ],
                                ),
                                padding: EdgeInsets.all(5.0),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      data[index]['name'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      '₹ ${data[index]['price']}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5.0),
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Chip(
                                        label: Container(
                                      child: Text(data[index]['size']),
                                    )),
                                    SizedBox(
                                      width: 18.0,
                                    ),
                                    Chip(
                                        label: Container(
                                      child: Text(data[index]['crust']),
                                    ))
                                  ],
                                ),
                                padding: EdgeInsets.all(5.0),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Text('Order placed on Date: '),
                                    new Text(
                                      data[index]['date']
                                          .toString()
                                          .substring(5, 10),
                                    ),
                                  ],
                                ),
                                padding: EdgeInsets.all(5.0),
                              ),
                              Container(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text('Paid Via Cash'),
                                    Container(
                                      child: RaisedButton(
                                        onPressed: () {_showAlert('This Feature is Coming Soon.Please Order Manually.');},
                                        child: Text(
                                          'REORDER',
                                          style:
                                              TextStyle(color: Colors.white70),
                                        ),
                                        color: Colors.green,
                                      ),
                                    )
                                  ],
                                ),
                                padding: EdgeInsets.all(5.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ));
          });
  }
}
