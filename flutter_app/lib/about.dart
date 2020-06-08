import 'package:flutter/material.dart';

class AboutUS extends StatefulWidget {
  @override
  _AboutUSState createState() => _AboutUSState();
}

class _AboutUSState extends State<AboutUS> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("About Us"),
      ),
    );
  }
}
