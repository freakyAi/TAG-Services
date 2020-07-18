import 'package:flutter/material.dart';

import 'getintouch.dart';

class Vending extends StatefulWidget {
  @override
  _VendingState createState() => _VendingState();
}

class _VendingState extends State<Vending> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Vending Machines"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new GetInTouch() )
                  );
                },
                child :Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 50),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          colors: [
                            Colors.blue[800],
                            Colors.blue[500],
                            Colors.blue[300]
                          ]
                      )
                  ),
                  child: Center(
                    child: Text("Contact Us / Get In Touch", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                  ),
                ),
              ),
              SizedBox(height: 30,)
            ],
          )
        )
    );
  }
}
