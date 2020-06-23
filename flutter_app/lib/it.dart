import 'package:flutter/material.dart';

class IT extends StatefulWidget {
  @override
  _ITState createState() => _ITState();
}

class _ITState extends State<IT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("IT Services"),
        ),
        body: Container(
          child: Text("In IT"),
        )
    );
  }
}
