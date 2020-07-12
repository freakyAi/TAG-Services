import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class GetInTouch extends StatefulWidget {
  @override
  _GetInTouchState createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {

  String url = "http://www.teamartsgroup.in";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Get In Touch"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Office No 511, Sterling Center, opp.Aurora Towers, MG Road, Camp, Pune, Maharashtra 411001."),
            SizedBox(height: 20,),
            Text("(+91) 982 399 9191"),
            SizedBox(height: 20,),
            InkWell(
              child: Text("info@teamartsgroup.in"),
            ),
            SizedBox(height: 20,),
            InkWell(
                child: Text(url),
                onTap: () {
                  _launchUrl(url);
                }
            ),
       ],)
      ),
    );
  }

  _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
