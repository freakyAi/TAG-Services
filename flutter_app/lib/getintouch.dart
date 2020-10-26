import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:tagservices/constants.dart';
import 'package:tagservices/validatons.dart';
import 'package:url_launcher/url_launcher.dart';

import 'main.dart';

class GetInTouch extends StatefulWidget {
  @override
  _GetInTouchState createState() => _GetInTouchState();
}

class _GetInTouchState extends State<GetInTouch> {

  String url = "http://www.teamartsgroup.in";

  String name;
  String phoneNumber;
  String email;
  String city;
  String message;
  final GlobalKey<FormState> _formKeyContact = GlobalKey<FormState>();

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  void validateData() {
    print("${name}, ${phoneNumber}, ${email}, ${city}, ${message}");
  }

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
        name = str;
      },
    );
  }

  Widget _buildphoneNumber() {
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Cell Phone"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
        if(!validatePhoneNo(value)) {
          Get.snackbar('Invalid credentials', "Please enter a valid mobile number!");
          return "Invalid phone number!";
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
        if(!validateEmail(value)) {
          Get.snackbar('Invalid credentials', "Please enter a valid email address!");
          return "Invalid email address!";
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
          labelText: "City"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        city = str;
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
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isDrawerOpen?20:0)
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(20),
          ),
            child: InkWell(
              onTap: () {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                });
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 50,),
                    Container(
                      margin: EdgeInsets.fromLTRB(20,0,50,0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          isDrawerOpen ? IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              scaleFactor = 1;
                              isDrawerOpen = false;
                            });
                          }
                          ): IconButton(icon: Icon(Icons.menu), onPressed: (){
                            setState(() {
                              xOffset = 230;
                              yOffset = 150;
                              scaleFactor = 0.6;
                              isDrawerOpen = true;
                            });
                          }),
                          //SizedBox(width: 50,),
                          Column(
                            children: [
                              Text("CONTACT INFO", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                            ],
                          ),
                          Column(),
                        ],
                      ),
                    ),
                    SizedBox(height: 10,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                                                Colors.blue[800],
                                                Colors.blue[500],
                                                Colors.blue[300]
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
                                                    Icon(FontAwesomeIcons.building),
                                                    SizedBox(width: 20,),
                                                    new Flexible(child: Text("Office No 511, Sterling Center, opp.Aurora Towers, MG Road, Camp, Pune, Maharashtra 411001.")),
                                                  ],
                                                ),
                                                SizedBox(height: 20,),
                                                new Row(
                                                  children: <Widget>[
                                                    Icon(FontAwesomeIcons.phoneAlt),
                                                    SizedBox(width: 20,),
                                                    new Flexible(child: Text("(+91) 982 399 9191"),),
                                                  ],
                                                ),
                                                SizedBox(height: 20,),
                                                new Row(
                                                  children: <Widget>[
                                                    Icon(FontAwesomeIcons.info),
                                                    SizedBox(width: 20,),
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
                                                    Icon(Icons.web),
                                                    SizedBox(width: 20,),
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
                                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
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
                                              Colors.blue[800],
                                              Colors.blue[500],
                                              Colors.blue[300]
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
                                                  onTap: () async {
                                                    if(!_formKeyContact.currentState.validate()){
                                                      return;
                                                    }
                                                    _formKeyContact.currentState.save();

                                                    var url = '$localhost/TAG/mobile_app/enquiry.php';
                                                    var resp = await post(url, body: {
                                                      'name': name,
                                                      'number': phoneNumber,
                                                      'email': email,
                                                      'city': city,
                                                      'enquiry': message,
                                                    });
                                                    log(resp.body);
                                                    if (resp.body == 'OK') {
                                                      Get.snackbar(
                                                        'Enquiry submitted successfully!', 'Refreshing page...',);
                                                      Future.delayed(Duration(seconds: 3,),() => Navigator.push(context, new MaterialPageRoute(
                                                          builder: (BuildContext context) => MyHomePage(pageController: 5,))
                                                      ) );
                                                    } else {
                                                      //TODO change description to 'Contact our customer care' etc...
                                                      Get.snackbar('Unknown error', 'Some error occured... Please try again later!', backgroundColor: Colors.red);
                                                    }
                                                  },
                                                  child :Container(
                                                    height: 50,
                                                    margin: EdgeInsets.symmetric(horizontal: 30),
                                                    decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        gradient: LinearGradient(
                                                            begin: Alignment.bottomLeft,
                                                            colors: [
                                                              Colors.blue[800],
                                                              Colors.blue[500],
                                                              Colors.blue[300]
                                                            ]
                                                        )
                                                    ),
                                                    child: Center(
                                                      child: Text("SUBMIT", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
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
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
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
