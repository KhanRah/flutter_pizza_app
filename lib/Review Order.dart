import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:onlinedeliveryapp/orderplacedsplash.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Review extends StatefulWidget {
  var userdata;
  var data1;
  var data2;
  var data3;
  Review({Key key,@required this.data1,@required this.data2,@required this.data3,@required this.userdata}):super(key:key);
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  initState()
  {
    getEmail();
  }



  String url = "https://dominosclone.herokuapp.com/api/orderdetails";

  String src;
  String name;
  String price;
  String description;
  String size;
  String crust;



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


  Future<String> apiPost(String url, Map jsonMap) async {
    try {
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(jsonMap)));
//      request.add(utf8.encode(json.encode(y)));
//      request.add(utf8.encode(json.encode(z)));

      HttpClientResponse response = await request.close();

      String replay = await response.transform(utf8.decoder).join();
      httpClient.close();
      print(replay);
      return replay;
    } catch (error) {
      print(error.toString());
    }
  }

  _onSubmit()
  {
    var map1={
      "src": widget.data1['src'],
      "name": widget.data1['name'],
      "price":widget.data1['price'],
      "description":widget.data1['description'],
      "size":widget.data2,
      "crust":widget.data3,
      "mobile":usermobile,
      "user_name":user_name
    };
   apiPost(url, map1);
    print(widget.data1);
    print(widget.data2);
    print(widget.data3);
    Navigator
        .of(context)
        .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
      return new OSplashScreen(userdata: widget.userdata,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Review Order'),
        backgroundColor: Colors.blue[900],),
      body: ListView(
        children: <Widget>[
          Container(
            child: Image.network(widget.data1['src'],fit: BoxFit.cover,),
          ),
          SizedBox(
            height: 10.0,
          ),
        Container(
          padding: EdgeInsets.all(6.0),
         child: Card(
           elevation: 6.0,
           child: Container(
             padding: EdgeInsets.all(25.0),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: <Widget>[
                 Text(widget.data1['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                 Text('₹ ${widget.data1['price']}',style: TextStyle(fontWeight: FontWeight.bold),),
               ],
             ),
           )
         ),),
          Container(
            padding: EdgeInsets.all(6.0),
            child: Card(
                elevation: 6.0,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.data1['description'],style: TextStyle(fontSize: 15.0),),
//                      Text('₹ ${widget.data1['price']}',style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                )
            ),),

          Container(
            padding: EdgeInsets.all(6.0),
            child: Card(
                elevation: 6.0,
                child: Container(
                  padding: EdgeInsets.all(17.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Chip(label:  Text(widget.data2,style: TextStyle(fontSize: 15.0),)),
                     ),
                     Container(
                       child: Chip(label:  Text(widget.data3,style: TextStyle(fontSize: 15.0),)),
                     ),
                    ],
                  ),
                )
            ),),
//              Card(
//            child: Column(
//              children: <Widget>[
//                Container(
//                  padding: EdgeInsets.all(20.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                  Text(widget.data1['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19.0),),
//                  Text('₹ ${widget.data1['price']}',style: TextStyle(fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//                ),
//
//                Container(
//                  padding: EdgeInsets.all(15.0),
//                  child:Text(widget.data1['description'],style: TextStyle(fontSize: 16.0),),
//                ),
//                Container(
//                  padding: EdgeInsets.all(20.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                     Container(
//                       child: Chip(label:  Text(widget.data2,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),)),
//                     ),
//                     Container(
//                       child: Chip(label:  Text(widget.data3,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),)),
//                     ),
//                    ],
//                  ),
//                ),
//              ],
//            ),
//            elevation: 6.0,
//          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Place Order',style: TextStyle(color: Colors.white),),
                    color: Colors.green,
                    onPressed: _onSubmit
                ),
              ],
            ),
          ),

        ],
      )
    );
  }
}
