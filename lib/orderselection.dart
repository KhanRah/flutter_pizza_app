import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinedeliveryapp/pizza.dart';
import 'package:flutter/cupertino.dart';
import 'package:onlinedeliveryapp/Review Order.dart';

import 'package:onlinedeliveryapp/vegmenu.dart';
class OrderSelection extends StatefulWidget {

  var userdata;

  var data;

  OrderSelection({Key key,@required this.data,@required this.userdata}):super(key:key);
  @override
  _OrderSelectionState createState() => _OrderSelectionState();
}

class _OrderSelectionState extends State<OrderSelection> {
  pizza _pizzaorder = new pizza();

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
    http.Response response= await http.get(Uri.encodeFull("https://dominosclone.herokuapp.com/api/customize"),
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
//  String selected=null;
//  String Selected=null;
//  List<DropdownMenuItem<String>> values = [];
//
//  loadDrop() {
//    values.add(new DropdownMenuItem(
//      child: new Text('Small'),
//      value: 'Small',
//    ));
//    values.add(new DropdownMenuItem(
//      child: new Text('Medium'),
//      value: 'Medium',
//    ));
//    values.add(new DropdownMenuItem(
//      child: new Text('Large'),
//      value: 'Large',
//    ));
//    // values.add(new DropdownMenuItem(child: new Text('medium'),value: 'medium',));
//  }
//  String crust=null;
//  List<DropdownMenuItem<String>> crusts = [];
//
//  loadCrust() {
//    crusts.add(new DropdownMenuItem(
//      child: new Text('Hand Tossed'),
//      value: 'HT',
//    ));
//    crusts.add(new DropdownMenuItem(
//      child: new Text('White Thin Crust'),
//      value: 'WTC',
//    ));
//    crusts.add(new DropdownMenuItem(
//      child: new Text('Cheese Brust'),
//      value: 'CB',
//    ));
//    // values.add(new DropdownMenuItem(child: new Text('medium'),value: 'medium',));
//  }
  void _showAlert(String text) {

    if (text.isEmpty) return;

    AlertDialog dialog = new AlertDialog(

     contentPadding: EdgeInsets.all(8.0),
     content: Container(
       padding: EdgeInsets.all(10.0) ,
       child: new Text(
         text,
         style: TextStyle(
           fontSize: 15.0,
         ),
         textAlign: TextAlign.center,
       ),
     ),
      actions: <Widget>[
        new FlatButton(
            onPressed: () {
              //moveToLogin();
              Navigator.pop(context);
            },
            child: new Text('Ok'))
      ],
    );

    showDialog(context: context, barrierDismissible: false,child: dialog);
  }
  @override
  // ignore: must_call_super

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
            padding: EdgeInsets.all(6.0),
            child: Card(
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

                                Text('Select Crust'),
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
                                  hint: Text('Crust'),
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
          Container(
            padding: EdgeInsets.all(15.0),
            child:Text('Select Toppins',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          SizedBox(height: 15.0,),

        Container(
          padding: EdgeInsets.all(6.0),
          child:   Card(
            elevation: 6.0,
              child: Column(
                children: <Widget>[
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Pepproni'),
                          new Checkbox(value: _value1, onChanged: _value1Changed),
                        ],
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Cheese'),
                          new Checkbox(value: _value2,  onChanged: _value2Changed),
                        ],
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Pineapples'),
                          new Checkbox(value: _value3, onChanged: _value3Changed),
                        ],
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Mushrooms'),
                          new Checkbox(value: _value4, onChanged: _value4Changed),
                        ],
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Peppers'),
                          new Checkbox(value: _value5, onChanged: _value5Changed),
                        ],
                      )

                  ),
                  Container(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Pickles'),
                          new Checkbox(value: _value6, onChanged: _value6Changed),
                        ],
                      )

                  ),
                ],
              )

          ),
        ),
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
                           _showAlert('Please Select Size and Crust');
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


//SliverFillRemaining(
//child: ListView(
//children: <Widget>[
//Card(
//child: Container(
//padding: EdgeInsets.all(15.0),
//child: Column(
//children: <Widget>[
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//Text('Deluxe Veg',style: TextStyle(fontWeight: FontWeight.bold),),
//
//],
//),
//),
//)
////],
//)
//)