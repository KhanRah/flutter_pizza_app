import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinedeliveryapp/Review Order.dart';
import 'package:flutter/cupertino.dart';

class DesertOrder extends StatefulWidget {

  var userdata;

  var data;

  DesertOrder({Key key,@required this.data,@required this.userdata}):super(key:key);
  @override
  _DesertOrderState createState() => _DesertOrderState();
}

class _DesertOrderState extends State<DesertOrder> {

  List<dynamic> data1 = [];
  void initState()
  {
    setState(() {
//      _mySelection= data1[0];
    });
    super.initState();
    this.getApi();
//    loadDrop();
//    loadCrust();
    print(widget.userdata);
  }

  Future getApi() async
  {
    http.Response response= await http.get(Uri.encodeFull("https://dominosclone.herokuapp.com/api/dessertcustomize"),
        headers: {
          "Accept":"application/json"
        }
    );
    setState(()
    {
      var x= json.decode(response.body);
      data1=x;
      name=x;;
      print(name);
//      print(response);
      print(data1);
//      data= ConvertdatatoJson['name'];
    });

//    print(data);
  }

  bool _value1 = false;
  bool _value2 = false;
  bool _value3 = false;
  bool _value4 = false;
  bool _value5 = false;
  bool _value6 = false;
  bool _isSelected;
  var _mySelection;
  String _mySelectionc;
  var name;
  void _value1Changed(bool value) => setState(() => _value1 = value);
  void _value2Changed(bool value) => setState(() => _value2 = value);
  void _value3Changed(bool value) => setState(() => _value3 = value);
  void _value4Changed(bool value) => setState(() => _value4 = value);
  void _value5Changed(bool value) => setState(() => _value5 = value);
  void _value6Changed(bool value) => setState(() => _value6 = value);

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
            child: new Text('Cancel'))
      ],
    );

    showDialog(context: context, barrierDismissible: false,child: dialog);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.blue[900],
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Customise'),
              background: Image.network(widget.data['src'],
                fit:BoxFit.cover
                ,),
            ),
          ),
          SliverList(delegate:SliverChildListDelegate(<Widget>
          [
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(8.0),
              child:Card(
                elevation: 6.0,
                child: Container(
                  height: 200.0,
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(widget.data['name'],style: TextStyle(fontWeight: FontWeight.bold,),textAlign: TextAlign.start,),
                      SizedBox(height: 7.0,),
                      Text('₹ ${widget.data['price']}',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text(widget.data['description']),
                      SizedBox(height: 25.0,),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                              child: Column(
                                children: <Widget>[

                                  Text('Select Size'),
//                              new DropdownButton(
//                                value: selected,
//                                items: values,
//                                hint: Text('Size'),
//                                onChanged: (value) {
//                                  selected=value;
//                                  setState(() {
//
//                                  });
//                                },
//
//                              ),
                                  new DropdownButton(
                                    items: data1.map((data1) {
                                      return new DropdownMenuItem(
                                        child: new Text(data1['size']),
                                        value: data1['size'],
                                      );
                                    }).toList(),
                                    hint: Text('Size'),
                                    onChanged: (newVal) {
                                      setState(() {
                                        _mySelection = newVal;
                                      });
                                    },
                                    value: _mySelection,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: <Widget>[

                                  Text('Select Toppins'),
//                              new DropdownButton(
//                                value: Selected,
//                                items: crusts,
//                                hint: Text('Crust'),
//                                onChanged: (value) {
//                                  Selected=value;
//                                  setState(() {
//
//                                  });
//                                },
//
//                              ),
                                  new DropdownButton(
                                    items: data1.map((data1) {
                                      return new DropdownMenuItem(
                                        child: new Text(data1['crust']),
                                        value: data1['crust'],
                                      );
                                    }).toList(),
                                    hint: Text('chips,nuts'),
                                    onChanged: (newValu) {
                                      setState(() {
                                        _mySelectionc = newValu;
                                      });
                                    },
                                    value: _mySelectionc,
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0,),

            SizedBox(
              height: 15.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                      child: Text('Confirm Customization',style: TextStyle(color: Colors.white),),
                      color: Colors.green,
                      onPressed: (){
                        if(_mySelectionc!=null && _mySelection!=null)
                        {
                          Navigator
                              .of(context)
                              .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
                            return new Review(data1: widget.data,data2:_mySelection,data3: _mySelectionc,userdata: widget.userdata,);
                          }));
                        }
                        else
                        {
                          _showAlert('Please Select Size and Toppins');
                        }
                      }),
                ],
              ),
            ),
            SizedBox(
              height: 15.0,
            ),

          ]))
        ],

      ),
    );
  }
}
