import 'package:flutter/material.dart';

class CCTV extends StatefulWidget {
  @override
  _CCTVState createState() => _CCTVState();
}

class _CCTVState extends State<CCTV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("CCTV Services"),
      ),
      body: Container(
        child: Text("In CCTV"),
      )
    );
  }
}
