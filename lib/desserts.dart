import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinedeliveryapp/orderselection.dart';
import 'package:onlinedeliveryapp/DesertOrderSelection.dart';

class Desserts extends StatefulWidget {

  var userdata;
  Desserts({Key key,@required this.userdata}):super(key:key);
  @override
  _DessertsState createState() => _DessertsState();
}

class _DessertsState extends State<Desserts> {
  var name;


  void initState()
  {
    super.initState();
    this.getApi();
  }
  List data;


  Future getApi() async
  {
    http.Response response= await http.get(Uri.encodeFull("https://dominosclone.herokuapp.com/api/desserts"),
        headers: {
          "Accept":"application/json"
        }
    );
    setState(()
    {
      var x= json.decode(response.body);
      data=x;
      name=x;;
      print(name);
//      print(response);
      print(data);
//      data= ConvertdatatoJson['name'];
    });

//    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: data==null ? 0: data.length,
        itemBuilder:(BuildContext context,int index)
        {
          return Container(child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(6.0),
                      child: Card(
                        elevation: 8.0,
                        child: Column(
                          children: <Widget>[
                            Stack(
                              //  fit: StackFit.expand,
                              alignment: Alignment.center,
                              children: <Widget>[
                                GestureDetector(
                                  child: Image.network(
                                    data[index]['src'],
                                    fit: BoxFit.fitWidth,
                                    alignment: Alignment.center,
                                    width: 400.0,
                                    height: 150.0,
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        new MaterialPageRoute(builder: (BuildContext context)=>new DesertOrder(data:data[index],userdata: widget.userdata,)));
                                  },
                                ),
                              ],
                            ),
                            Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(data[index]['name'],textAlign: TextAlign.start,style: TextStyle(fontWeight: FontWeight.bold),),
                                      Text('₹ ${data[index]['price']}',style: TextStyle(fontWeight: FontWeight.bold),),
//                                      Text(data[index]['type']),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text(data[index]['description']),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      RaisedButton(onPressed: (){Navigator.push(context,
                                          new MaterialPageRoute(builder: (BuildContext context)=>new DesertOrder(data:data[index],userdata: widget.userdata,)));},color: Colors.green, child: Text('Order Now',style: TextStyle(color: Colors.white),),),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ]
          ),);
        }


    );
  }
}