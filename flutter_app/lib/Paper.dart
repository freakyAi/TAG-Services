import 'package:flutter/material.dart';

class Paper extends StatefulWidget {
  @override
  _PaperState createState() => _PaperState();
}

class _PaperState extends State<Paper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Paper Shredding Machines"),
        ),
        body: Container(
          child: Text("In paper machines"),
        )
    );
  }
}
