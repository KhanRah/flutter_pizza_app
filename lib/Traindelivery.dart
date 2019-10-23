import 'package:flutter/material.dart';

class deliverOnTrain extends StatefulWidget {
  @override
  _deliverOnTrainState createState() => _deliverOnTrainState();
}

class _deliverOnTrainState extends State<deliverOnTrain> {



_onSubmit()
{

}

  bool _value6 = false;

//  void _value6Changed(bool value) => setState(() =>
//
//
//  _value6 = value);

  void _value6Changed(bool value)
  {
    setState(() {
      _value6=value;
    });

  }
//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Deliver On Train'),
      ),
      body: Container(
        padding: EdgeInsets.all(7.0),
        child: ListView(
          children: <Widget>[
            Image.asset('assets/14.jpeg'),
            Container(
              padding: EdgeInsets.only(top: 7.0),
              child: Card(
                  elevation: 6.0,
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              child: Text(
                                'PNR Number',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              padding: EdgeInsets.all(
                                6.0,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          child: Row(
                            children: <Widget>[
                              new Checkbox(
                                  value: _value6, onChanged: _value6Changed),
                              Flexible(child: Text( 'I agree to the IRCTC Ordering Terms & Conditions',overflow: TextOverflow.clip,),)
                            ],
                          ),
                        ),
                        Container(
                            child: RaisedButton(
                          onPressed: _onSubmit,
                          child: Text(
                            'SUBMIT',
                            style: TextStyle(color: Colors.white),
                          ),
                          color: Colors.lightGreen[800],
                        ))
                      ],
                    ),
                  )),
            ),
            SizedBox(
              height: 9.0,
            ),
            Container(
              child: Card(
                elevation: 6.0,
                child: Container(
                  padding: EdgeInsets.all(18.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.train),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'IRCTC Orders',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Icon(Icons.arrow_right)
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
