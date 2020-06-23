import 'package:flutter/material.dart';

class Electrical extends StatefulWidget {
  @override
  _ElectricalState createState() => _ElectricalState();
}

class _ElectricalState extends State<Electrical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Electrical Services"),
        ),
        body: Container(
          child: Text("In Electrical"),
        )
    );
  }
}
