import 'package:flutter/material.dart';
import 'package:tagservices/Drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class GetInTouch extends StatefulWidget {
  @override
  _GetInTouchState createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {

  String url = "http://www.teamartsgroup.in";

  String Name;
  String phoneNumber;
  String email;
  String venue;
  String message;
  final GlobalKey<FormState> _formKeyContact = GlobalKey<FormState>();

  Widget _buildName(){
    return TextFormField(
      decoration: new InputDecoration(
        labelText: "Your Name",
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        Name = str;
      },
    );
  }

  Widget _buildphoneNumber(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Cell Phone"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        phoneNumber = str;
      },
    );
  }

  Widget _buildEmail(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Email ID"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        email = str;
      },
    );
  }

  Widget _buildVenue(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Venue"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        venue = str;
      },
    );
  }

  Widget _buildMessage(){
    return TextFormField(
      maxLines: 5,
      decoration: new InputDecoration(
          labelText: "Message",

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )
      ),
      // ignore: missing_return
      validator: (String details){
        if(details.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        message = str;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Get In Touch"),
      ),
      drawer: DrawerMenu(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),),
                Text("CONTACT INFO", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),)
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.orange[800],
                            Colors.orange[400],
                            Colors.orange[400]
                          ]
                      )
                  ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Flexible(child: Text("Office No 511, Sterling Center, opp.Aurora Towers, MG Road, Camp, Pune, Maharashtra 411001.")),
                                ],
                              ),
                              SizedBox(height: 20,),
                              new Row(
                                children: <Widget>[
                                  new Flexible(child: Text("(+91) 982 399 9191"),),
                                ],
                              ),
                              SizedBox(height: 20,),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: InkWell(
                                      child: Text("info@teamartsgroup.in"),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20,),
                              new Row(
                                children: <Widget>[
                                  new Flexible(
                                    child: InkWell(
                                        child: Text(url),
                                        onTap: () {
                                          _launchUrl(url);
                                        }
                                    ),
                                  ),
                                ],
                              ),
                            ],),
                        ),
                      ),
                    ),
                  ),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.fromLTRB(20, 10, 10, 10),),
                Text("GET IN TOUCH", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),)
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  //width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          colors: [
                            Colors.orange[800],
                            Colors.orange[400],
                            Colors.orange[400]
                          ]
                      )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Form(
                        key: _formKeyContact,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                          child: new Column(
                            children: <Widget>[
                              new Row(
                                children: <Widget>[
                                  new Flexible(child: _buildName()),
                                  SizedBox(width: 20),
                                  new Flexible(child: _buildphoneNumber()),
                                ],
                              ),
                              SizedBox(height: 15.0),
                              _buildEmail(),
                              SizedBox(height: 15.0),
                              _buildVenue(),
                              SizedBox(height: 20.0),
                              _buildMessage(),
                              SizedBox(height: 15.0),
                              InkWell(
                                onTap: () {
                                  if(!_formKeyContact.currentState.validate()){
                                    return;
                                  }
                                  _formKeyContact.currentState.save();
                                  //Fluttertoast.showToast(msg: "Contacted!");
                                  Navigator.pushReplacement(context, new MaterialPageRoute(
                                      builder: (BuildContext context) => new MyHomePage() ),
                                  );
                                },
                                child :Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 50),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomLeft,
                                          colors: [
                                            Colors.orange[600],
                                            Colors.orange[400],
                                            Colors.orange[400],
                                          ]
                                      )
                                  ),
                                  child: Center(
                                    child: Text("MAKE A RESERVATION", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
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
