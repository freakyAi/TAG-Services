import 'package:flutter/material.dart';

class HouseKeeping extends StatefulWidget {
  @override
  _HouseKeepingState createState() => _HouseKeepingState();
}

class _HouseKeepingState extends State<HouseKeeping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("House Keeping"),
        ),
        body: Container(
          child: Text("In House Keeping"),
        )
    );
  }
}
