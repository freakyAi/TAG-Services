import 'package:flutter/material.dart';

class Plumbing extends StatefulWidget {
  @override
  _PlumbingState createState() => _PlumbingState();
}

class _PlumbingState extends State<Plumbing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Plumbing Services"),
        ),
        body: Container(
          child: Text("In plumbing"),
        )
    );
  }
}
