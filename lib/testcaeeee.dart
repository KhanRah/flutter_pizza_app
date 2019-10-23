import 'package:flutter/material.dart';

class toppins extends StatefulWidget {
  @override
  _toppinsState createState() => _toppinsState();
}

class _toppinsState extends State<toppins> {
  bool isChecked= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Checkboxes'),
        ),
      body: Container(
        child: Row(
          children: <Widget>[Stack(
            children: <Widget>[
              Image.network('https://image.shutterstock.com/image-photo/traditional-italian-pizza-salmon-broccoli-450w-1330253252.jpg',height:300 ,width: 300,),
              Positioned(
                  top: 0.0,
                  bottom:  120.0,
                  right: 200.0,
                  child: Checkbox(

                      value: isChecked, onChanged: (value)
                  {
                    setState(() {
                      isChecked=value;
                    });
                  }))
            ],
          )
          ],
        ),
      ),
    );
  }
}

