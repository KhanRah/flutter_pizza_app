import 'package:flutter/material.dart';
import 'package:onlinedeliveryapp/menu.dart';
import 'package:onlinedeliveryapp/LoginScreen.dart';
import 'package:onlinedeliveryapp/editprofile.dart';
import 'package:onlinedeliveryapp/menu.dart';
import 'package:onlinedeliveryapp/myorders.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Home extends StatefulWidget {
  var data;


  Home({Key key,}):super(key:key);
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  var usermobile;
  var password;
  var _id;
  var user_name='k';

  void getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString('mobile');
    var pass = prefs.getString('password');
    var username = prefs.getString('user_name');
    var id = prefs.getString('_id');

    setState(() {
      usermobile = mobile;
      password = pass;
      user_name=username;
      _id=id;
    });
//    var map1 = {"mobile": usermobile, "password": password};
//    apiPost(url, map1);

  }




  MenuState obj = new MenuState();
  int selectedRadio;

  void initState() {
    // TODO: implement initState
    super.initState();
    getEmail();
    setState(() {
      selectedRadio = 1;
    });
  }

  setSelectedRadio(value) {}

  String _value = null;
  List<String> _values = new List<String>();

  @override
  void _onChanged(String value) {
    setState(() {
      _value = value;
    });
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
          backgroundColor: Colors.blue[900],
          title: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/location');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0.0, 2.0, 2.0, 2.0),
              child:
              Row(
                children: <Widget>[
                  Expanded(child:Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Deliver To:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white,fontSize: 13.0),
                      ),
                      SizedBox(width: 2.0,),
                      Flexible(
                          child:Text('IDA Uppal Quantana Limited',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 13.0,
                                color: Colors.white
                            ),)
                      )
                    ],
                  ),),
                ],
              ),
            )
//            onTap: (){Navigator.of(context).pushNamed('/location');},
          ),
          actions: <Widget>[
            OutlineButton(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                'Change',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed('/location');
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      child: Text(user_name.substring(0,1)),
                    ),
                    accountName: Text(user_name),
                    accountEmail: Text(usermobile),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: <Color>[Colors.blue[900], Colors.blue])),
                  ),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Icon(
                          Icons.settings,
                          color: Colors.grey,
                        ),
                        onTap: () {  Navigator.of(context).pop();
                        Navigator.push(context,
                            new MaterialPageRoute(builder: (BuildContext context)=>new EditProfile()));}
                      )
                    ),
                  ),
                ],
              ),

           GestureDetector(
             child: Container(
                 padding: EdgeInsets.all(10.0),
                 child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
                   children: <Widget>[
                     Icon(Icons.location_on),
                     Padding(
                       padding: EdgeInsets.all(5.0),
                       child: Text(
                         'Track My Order',
                         style: TextStyle(fontWeight: FontWeight.bold),
                       ),
                     )
                   ],
                 ),
               color: Colors.grey[300],
               ),
             onTap: (){_showAlert("You will Get This Feature on Next Update.Stay Relax Your Order will reach Soon");},
           ),
              CustomListtile(Icons.history, 'Order History', () => {
                           Navigator.pop(context),
                Navigator.push(context,
                  new MaterialPageRoute(builder: (BuildContext context)=>new myOrders()))}),
              CustomListtile(Icons.local_offer, 'Deals & Offers', () => {_showAlert("You are not Eligible Yet.Order More items to Unlock deals and offers")}),
              CustomListtile(Icons.fastfood, 'Menu', () => {
                Navigator.pop(context),
                Navigator.push(context,
              new MaterialPageRoute(builder: (BuildContext context)=>new Menu()))}),
              CustomListtile(Icons.train, 'Deliver On Train', () => {
               Navigator.pop(context),
                Navigator.of(context).pushNamed('/mytrainorders')}),
              CustomListtile(Icons.favorite_border, 'My Favourites', () => {}),
              CustomListtile(Icons.contact_mail, 'Contact US', () => {}),
              CustomListtile(Icons.exit_to_app, 'LogOut', () async {

                SharedPreferences prefs= await SharedPreferences.getInstance();
                prefs.remove('mobile');
                prefs.remove('password');
                Navigator
                  .of(context)
                  .pushReplacement(new MaterialPageRoute(builder: (BuildContext context) {
              return new Login();
              }));}),
            ],
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 20.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    new Radio(
                        activeColor: Colors.blue[900],
                        value: 1,
                        groupValue: selectedRadio,
                        onChanged: (val) {
//                        setSelectedRadio(val);
//                        Navigator.of(context).pushNamedAndRemoveUntil('/location',
//                                (Route <dynamic> route)=> false);
                          Navigator.pop(context);
                        }),
                    GestureDetector(
                      child: new Text(
                        'Delivery',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    new Radio(
                      activeColor: Colors.blue[900],
                      value: 2,
                      groupValue: selectedRadio,
                      onChanged: (val) {
                        setSelectedRadio(val);
                        Navigator.of(context).pushNamed('/pickup');
                      },
                    ),
                    new Text(
                      'PickUp',
                      style: new TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
//                    width: 70.0,
                    ),
                   Expanded(child:  Container(
                     padding: EdgeInsets.only(left: 32.0),
                     child: GestureDetector(
                       child: Row(
                         children: <Widget>[
                           Icon(Icons.train),
                           Text('Deliver To Train')
                         ],
                       ),
                 onTap: ()
                 {
                   Navigator.of(context).pushNamed('/mytrainorders');
                 },
                     ),
                   )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(5.0),
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: 200.0,
                  child: ListView(
                        scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          child: GestureDetector(
                              child: Container(
                                  width: 160.0,
                                  height: 145,
                                  child: Image.asset('assets/1.jpeg')),
                              onTap: () {
                                Navigator.push(context,
                                    new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                              }),
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                          child: Container(
                              width: 160.0,
                              height: 150,
                              child: Image.asset('assets/2.jpeg')),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                          },
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                          child: Container(
                              width: 160.0,
                              height: 150,
                              child: Image.asset('assets/3.jpeg')),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                          },
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                          child: Container(
                              width: 160.0,
                              height: 150,
                              child: Image.asset('assets/4.jpeg')),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                          },
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                          child: Container(
                              width: 160.0,
                              height: 150,
                              child: Image.asset('assets/5.jpeg')),
                          onTap: () {
                            Navigator.push(context,
                                new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                          },
                        ),
                        SizedBox(
                          width: 4.0,
                        ),
                        GestureDetector(
                            child: Container(
                                width: 160.0,
                                height: 150,
                                child: Image.asset('assets/6.jpeg')),
                            onTap: () {
                              Navigator.push(context,
                                  new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                            })
                      ]),
                ),
              ),
              SizedBox(
                height: 1.0,
              ),
              Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Explore Menu',
                  style: TextStyle(fontSize: 17.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.all(6.0),
                child: Row(
//                mainAxisAlignment: MainAxisAlignment.center,
//                scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Expanded(child:
                    GestureDetector(
                      child: Card(
                        child: Container(
//                        height: 150,
//                        width: 120,
                          child: Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(20.0),
                                child: Column(
                                  children: <Widget>[
                                    CachedNetworkImage(imageUrl: "http://pngimg.com/uploads/pizza/pizza_PNG44092.png",
                                      height: 120,width: 120, errorWidget: (context, url, error) => new Icon(Icons.error),),
                                    Text(
                                      'Veg-Pizza',
                                      style: TextStyle(
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        elevation: 6.0,
                      ),
                      onTap: () {

                        Navigator.push(context,
                            new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                      },
                    ),),
                   Expanded(child:  GestureDetector(
                     child: Card(
                       elevation: 6.0,
                       child: Container(
//                        height: 150,
//                        width: 190,
                         child: Column(
                           children: <Widget>[
                             Container(
                               padding: EdgeInsets.all(15.0),
                               child: Column(
                                 children: <Widget>[
                                   CachedNetworkImage(imageUrl: "http://pngimg.com/uploads/pizza/pizza_PNG44078.png",
                                   height: 120,width: 120, errorWidget: (context, url, error) => new Icon(Icons.error),),
//                                   Image.network(
//                                     "http://pngimg.com/uploads/pizza/pizza_PNG44078.png",
//                                     height: 120,
//                                     width: 120,
//                                   ),
                                   SizedBox(
                                     height: 7.0,
                                   ),
                                   Text(
                                     'Non-Veg Pizza',
                                     style: TextStyle(
                                         fontSize: 13.0,
                                         fontWeight: FontWeight.bold),
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                     onTap: () {

                       Navigator.push(context,
                           new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                     },
                   ),),
                  ],
                ),
              ),

              Container(
                padding: EdgeInsets.all(6.0),
                child: Row(
//                scrollDirection: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                   Expanded(child:  GestureDetector(
                     child: Card(

                       child: Container(
//                        height: 150,
//                        width: 190,
                         child: Column(
                           children: <Widget>[
                             Container(
                               padding: EdgeInsets.all(15.0),
                               child: Column(
                                 children: <Widget>[
                               CachedNetworkImage(imageUrl: "http://pngimg.com/uploads/cocktail/cocktail_PNG145.png",
                                 height: 95,width: 95, errorWidget: (context, url, error) => new Icon(Icons.error),),
                                   SizedBox(
                                     height: 7.0,
                                   ),
                                   Text(
                                     'Bevrages',
                                     style: TextStyle(
                                         fontSize: 13.0,
                                         fontWeight: FontWeight.bold),
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       elevation: 6.0,
                     ),
                     onTap: () {
//                       obj.Method(3);
                       Navigator.push(context,
                           new MaterialPageRoute(builder: (BuildContext context)=>new Menu())); },
                   ),),
                  Expanded(child:   GestureDetector(
                    child: Card(
                      child: Container(
//                        height: 150,
//                        width: 190,
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                children: <Widget>[
                                  CachedNetworkImage(imageUrl: "https://cdn.pixabay.com/photo/2018/04/18/12/06/dessert-3330261_1280.png",
                                         height: 95,width: 95, errorWidget: (context, url, error) => new Icon(Icons.error),),

                                  SizedBox(
                                    height: 7.0,
                                  ),
                                  Text(
                                    'Desserts',
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      elevation: 6.0,
                    ),
                    onTap: () {
                      Navigator.push(context,
                          new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                    },
                  ),),
                   Expanded(child:  GestureDetector(
                     child: Card(
                       child: Container(
//                        height: 150,
//                        width: 190,
                         child: Column(
                           children: <Widget>[
                             Container(
                               padding: EdgeInsets.all(15.0),
                               child: Column(
                                 children: <Widget>[
                                   CachedNetworkImage(imageUrl: "https://www.seekpng.com/png/full/70-708524_chicken-strips-chicken-strips-png.png",
                                     height: 95,width: 95, errorWidget: (context, url, error) => new Icon(Icons.error),),

                                   SizedBox(
                                     height: 7.0,
                                   ),
                                   Text(
                                     'Sides',
                                     style: TextStyle(
                                         fontSize: 13.0,
                                         fontWeight: FontWeight.bold),
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                       elevation: 6.0,
                     ),
                     onTap: () {
                       Navigator.push(context,
                           new MaterialPageRoute(builder: (BuildContext context)=>new Menu()));
                     },
                   ),),
                  ],
                ),
              ),
              Container(
                child: Container(
                  padding: EdgeInsets.all(4.0),
                  height: 100.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Container(
//                      width: 200,
                        child: Image.asset('assets/7.jpeg'),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Container(
//                      width: 200,
                        child: Image.asset('assets/8.jpeg'),
                      ),
                      SizedBox(
                        width: 3.0,
                      ),
                      Container(
//                      width: 200,
                        child: Image.asset('assets/9.jpeg'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class CustomListtile extends StatelessWidget {
  IconData icon;
  String text;
  Function onTap;

  CustomListtile(this.icon, this.text, this.onTap);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
        child: InkWell(
          onTap: onTap,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(icon),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        text,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    )
                  ],
                ),
                Icon(Icons.arrow_right)
              ],
            ),
          ),
        ));
    ;
  }
}
