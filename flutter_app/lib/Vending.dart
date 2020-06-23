import 'package:flutter/material.dart';

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
          child: Text("In vending"),
        )
    );
  }
}
