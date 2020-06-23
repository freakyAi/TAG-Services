import 'package:flutter/material.dart';

class AC extends StatefulWidget {
  @override
  _ACState createState() => _ACState();
}

class _ACState extends State<AC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Air Conditioner"),
        ),
        body: Container(
          child: Text("In AC"),
        )
    );
  }
}
