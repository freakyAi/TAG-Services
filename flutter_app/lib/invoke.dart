import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:tagservices/TicketHistory.dart';
import 'package:tagservices/constants.dart';
import 'package:tagservices/main.dart';
import 'package:tagservices/validatons.dart';

class InvokeTicket extends StatefulWidget {
  @override
  _InvokeTicketState createState() => _InvokeTicketState();
}

class _InvokeTicketState extends State<InvokeTicket> {
  final controller = new TextEditingController();
  var _servicesOptions = {
    "CCTV Services",
    "Air Conditioner",
    "House Keeping",
    "Electrical Services",
    "Plumbing Services",
    "IT Services",
    "Vending Machines",
    "Paper Shredding Machines"
  };
  var cityOptions = {"Aurangabad", "Parbhani"};
  String city;
  String details;
  var service;
  String path;
  var topic;
  var selectedImage;

  // ignore: non_constant_identifier_names
  int token_no;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ignore: non_constant_identifier_names
  // var help_topic = [
  //   "CCTV Issue",
  //   "Feedback",
  //   "General Enquiry",
  //   "Report a Problem",
  //   "Access Issue"
  // ];

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  Widget _buildServices() {
    return DropdownButtonFormField<String>(
      items: _servicesOptions.map((String dropDownStringItem) {
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (_value) {
        setState(() {
          this.service = _value;
          print("Service" + service.toString());
        });
      },
      hint: Text(" - Select a Service - "),
      value: service,
      // ignore: missing_return
      validator: (String value) {
        if (value == null) {
          return "Required";
        }
      },
    );
  }

  getCityList() async {
    var url = "$localhost/TAG/mobile_app/tickets.php?cityList=true";
    var resp = await http.get(url);
    var respJson = jsonDecode(resp.body);
    // log("City list: "+respJson.toString());
    // log("Type: "+respJson.runtimeType.toString());
    var respList = List.from(respJson);
    respList.forEach((element) {
      cityOptions.add(element.toString());
    });
    // cityOptions = respJson;
    // log("City options: "+cityOptions.toList().toString());
    return cityOptions;
  }

  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content: new Row(
        children: [
          CircularProgressIndicator(),
          Container(margin: EdgeInsets.only(left: 7),child:Text("Loading..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
    );
  }

  Widget _buildCity() {
    return FutureBuilder(
        future: getCityList(),
        builder: (context, snapshot) {
          log("List type: "+cityOptions.runtimeType.toString());
          var data;
          if(!snapshot.hasData)
            data = ["Aurangabad","Chiplun","Gondia","Hingoli","Madgaon","Mahad","Nanded","Pandharpur","Parbhani","Ponda","Pune","Shirdi","Vasco"];
          else
            data = snapshot.data;
          return DropdownButtonFormField<String>(
          items: data.map<DropdownMenuItem<String>>((String dropDownStringItem) {
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Text(dropDownStringItem),
            );
          }).toList(),
          onChanged: (_value) {
            setState(() {
              this.city = _value;
            });
            print("Service" + city.toString());
          },
          hint: Text(" - Select a Service - "),
          value: city,
          // ignore: missing_return
          validator: (String value) {
            if (value == null) {
              return "Required";
            }
          },
        );
      }
    );
  }

  Widget _buildDetails() {
    return TextFormField(
      maxLines: 5,
      decoration: new InputDecoration(
          labelText: "Issue Details",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )
      ),
      // ignore: missing_return
      validator: (String details) {
        if (details.isEmpty) {
          return "Required";
        }
      },
      onSaved: (String str) {
        details = str;
      },
    );
  }

  Widget _buildFile() {
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(00.0),
          child: new Row(
            children: <Widget>[
              Text("Choose a file (optional): "),
              SizedBox(width: 10.0),
              RaisedButton(
                onPressed: () => _fileOpener(),
                child: new Text("Choose File"),
              ),
            ],
          )
      ),
    );
  }


  _fileOpener() async {
    //path = (await FilePicker.getFilePath()) as String; //use getFilePath() to get path and getFile() to get File
    var pickedFile = await FilePicker.getFile(type: FileType.image);
    var fileBytes = await pickedFile.readAsBytesSync();
    String fileString = base64Encode(fileBytes);
    String filePath = pickedFile.path;
    var pathSplit = filePath.split("/");
    log(pathSplit[pathSplit.length - 1]);
    //log(fileString);
    service = fileString;
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isDrawerOpen ? 20 : 0)
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
            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 50, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDrawerOpen ? IconButton(
                          icon: Icon(Icons.arrow_back_ios), onPressed: () {
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      }
                      ) : IconButton(icon: Icon(Icons.menu), onPressed: () {
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
                          Text(
                            "Invoke New Ticket", style: TextStyle(
                              fontSize: 18),)
                        ],
                      ),
                      Column(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                      child: Form(
                        key: _formKey,
                        // autovalidate: true,
                        child: new Column(
                          children: <Widget>[
                            //SizedBox(height: 40,),
                            // _buildTopic(),
                            SizedBox(height: 20.0),
                            _buildServices(),
                            SizedBox(height: 20.0),
                            _buildCity(),
                            SizedBox(height: 20.0),
                            _buildDetails(),
                            // Text('Please mention your branch'),
                            // SizedBox(height: 20.0),
                            // _buildFile(),
                            SizedBox(height: 40.0),
                            InkWell(
                              onTap: () async {
                                if (!_formKey.currentState.validate()) {
                                  return;
                                }
                                _formKey.currentState.save();
                                // Navigator.pushReplacement(context, new MaterialPageRoute(
                                //     builder: (BuildContext context) => new MyHomePage() ),
                                // );
                                log(city + "," + details + "," + service);

                                SharedPreferences prefs = await SharedPreferences
                                    .getInstance();
                                String clientId = await prefs.getString(
                                    'client_id')
                                    .toString();
                                String email = await prefs.getString('email_id')
                                    .toString();
                                log("Prefs: $clientId, $email");
                                var url = '$localhost/TAG/mobile_app/tickets.php';
                                var resp = await http.post(url, body: {
                                  //TODO send email address (and client id perhaps) from sharedprefs
                                  'newTicket': true.toString(),
                                  'service': service,
                                  'city': city.toLowerCase(),
                                  'details': details,
                                  'email_id': email,
                                  "client_id": clientId,
                                  // 'client_id': clientId,
                                  //  TODO send image too and handle it
                                });
                                //Just reverts the post request for now
                                log("response: " + resp.body);
                                Map respJson = jsonDecode(resp.body);
                                if (respJson['status_code'] == 'OK') {
                                  Get.snackbar(
                                      'Ticket created successfully!', 'Refreshing page...',);
                                  Future.delayed(Duration(seconds: 3,),() => Navigator.push(context, new MaterialPageRoute(
                                      builder: (BuildContext context) => MyHomePage(pageController: 2,))
                                  ) );
                                } else {
                                  //TODO change description to 'Contact our customer care' etc...
                                  Get.snackbar('Ticket creation failed!', 'Please contact us...', backgroundColor: Colors.red);
                                }
                              },
                              child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 80),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomLeft,
                                        colors: [
                                          Colors.blue[500],
                                          Colors.blue[500],
                                          Colors.blue[500],
                                        ]
                                    )
                                ),
                                child: Center(
                                  child: Text("Submit", style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}