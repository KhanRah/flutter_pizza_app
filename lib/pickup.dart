import 'package:flutter/material.dart';

class pickup extends StatefulWidget {
  @override
  _pickupState createState() => _pickupState();
}

class _pickupState extends State<pickup> {
  final TextEditingController _controller = new TextEditingController();
  var items = ['Hyderabad', 'Chennai', 'Pune', 'Delhi'];

  int selectedRadio;

  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      selectedRadio = 2;
    });
  }

  setSelectedRadio(value) {}

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue[900],
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            title: Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Pickup:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  ),
                  SizedBox(width: 5.0,),
                  Text(
                    'Select Restaurant for Pickup',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),
                  ),
                ],
              ),
            )
          ),
          body: ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 20.0, bottom: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
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
//                        setSelectedRadio(val);
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
                padding: EdgeInsets.all(8.0),
                child: Card(
                  elevation: 10.0,
                  child: new Container(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text('Which store would you like to Pick up from '),
                        SizedBox(
                          height: 22.0,
                        ),
                        TextField(
                          controller: _controller,
                          decoration: InputDecoration(hintText: 'Select City'),
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                        TextField(
                          decoration:
                              InputDecoration(hintText: 'Select Restaurant'),
                        ),
                        SizedBox(
                          height: 22.0,
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
