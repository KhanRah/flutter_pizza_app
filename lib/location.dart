import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
//import 'package:geolocator/geolocator.dart';




class deliveryloction extends StatefulWidget {
  @override
  _deliveryloctionState createState() => _deliveryloctionState();
}

class _deliveryloctionState extends State<deliveryloction> {

  int selectedRadio;
  void initState() {
    // TODO: implement initState
    super.initState();
   setState(() {
     selectedRadio=1;
   });
  }
  setSelectedRadio(value)
  {
//    setState(() {
//      selectedRadio=value;
//    });
//    if(value==2)
//    {
//      Navigator.of(context).pushNamed('/pickup');
//      setState(() {
//        value=2;
//      });
//    }
  }
//  var latitude='1';
//  var longitude='1';
//
//  Future<List> getLocation() async {
//    try {
//      Position position = await Geolocator()
//          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//      var lat = position.latitude;
//
//      var long = position.longitude;
//      setState(() {
//        latitude = lat.toString();
//        longitude = long.toString();
//      });
//
//      GeolocationStatus geolocationStatus =
//      await Geolocator().checkGeolocationPermissionStatus();
//      print(geolocationStatus);
//
//    } catch (e) {
//        print(e.toString());
//    }
//
//    print(latitude);
//    print(longitude);
//    return [latitude, longitude];
//
//  }



  @override

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
          color: Colors.black,),
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search for Area,Locality'
              )
            ),
          actions: <Widget>[
           SizedBox(
             child: MaterialButton(
                 child: Text('Locate Me',style: TextStyle(color: Colors.green),),
                 onPressed: (){ ;
                 }),
           )
          ],
          ),
        body:ListView(
          children: <Widget>[
        Container(
        padding: EdgeInsets.only(left: 0.0,right: 0.0,top: 20.0,bottom: 0.0),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            new Radio(
              activeColor: Colors.blue[900],
              value: 1,
              groupValue: selectedRadio,
              onChanged: (val)
              {
                setSelectedRadio(val);
              },

            ),
            GestureDetector(
              child:   new Text(
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
              onChanged: (val)
              {
                setSelectedRadio(val);
                Navigator.of(context).pushNamed('/pickup');
              },

            ),
            new Text(
              'PickUp',
              style: new TextStyle(
                fontSize: 16.0,
              ),
            )
          ],
        ),
      ),
        Container(
          padding: EdgeInsets.all(20.0),
          child: Text('Recent Searches',style:
          TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),),
        ),
            Container(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.location_on),
                      Column(
                        children: <Widget>[
                          Text('IDA Uppal Pheonix Towers...',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0
                          ),
                          ),

                          Text('Quantana PVT Ltd',
                          style: TextStyle(
                            fontSize: 13.0
                          ),
                          )
                        ],
                      ),
                      Icon(Icons.delete)
                    ],
                  ),
                ),
              ),
            )
          ],
        )

        ),
    );
  }
}






