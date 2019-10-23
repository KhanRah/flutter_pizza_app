import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/xxxxxxxxxx.dart';
import 'package:onlinedeliveryapp/vegmenu.dart';
import 'package:onlinedeliveryapp/nonvegmenu.dart';
import 'package:onlinedeliveryapp/beverages.dart';
import 'package:onlinedeliveryapp/sides.dart';
import 'package:onlinedeliveryapp/desserts.dart';

class Menu extends StatefulWidget {

  var userdata;
  var ind;
  Menu({Key key,}):super(key:key);
  @override
  MenuState createState() => MenuState();
}

class MenuState extends State<Menu> {
  @override

  void Method(int x) {
    setState(() {
      index = x;
    });
    print(index);
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 5,
        initialIndex: index,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            bottom: TabBar(
              isScrollable: true,
              tabs: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 15.0,top: 5.0),
                  child: Text('VEG PIZZA'),
                ),
               Container(
                 padding: EdgeInsets.only(bottom: 15.0,top: 5.0),
                 child:  Text('NON-VEGPIZZA'),
               ),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0,top: 5.0),
                  child: Text('SIDES'),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0,top: 5.0),
                  child:Text('BEVERAGES'),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 15.0,top: 5.0),
                  child: Text('DESSERTS'),
                )
              ],
            ),
            title:  Text('Explore Menu'),
          ),
          body: TabBarView(
            children: [
              VegMenu(),
              NonVegMenu(),
              Sides(),
              Bevrages(),
              Desserts()
            ],
          ),
        ));
  }
}

//return Scaffold(
//appBar: AppBar(
//bottom: TabBar(
//tabs: [
//Tab(icon: Icon(Icons.directions_car)),
//Tab(icon: Icon(Icons.directions_transit)),
//Tab(icon: Icon(Icons.directions_bike)),
//],
//),
//title: Text('Tabs Demo'),
//),
//body: TabBarView(
//children: [
//Icon(Icons.directions_car),
//Icon(Icons.directions_transit),
//Icon(Icons.directions_bike),
//],
//),
//);

//Menu Class:
//import 'package:flutter/material.dart';
//
//class Menu extends StatefulWidget {
//  @override
//  MenuState createState() => MenuState();
//}
//
//class MenuState extends State<Menu> {
//
//  void Method(int x)
//  {
//    index=x;
//    print(index);
//  }
//  int index=2;
//  @override
//  Widget build(BuildContext context) {
//    return DefaultTabController(
//        length: 5,
//        initialIndex: index,
//        Home Class:
//        onTap: () {
//      obj.Method(2);
//      Navigator.of(context).pushNamed('/menu');
//    },
