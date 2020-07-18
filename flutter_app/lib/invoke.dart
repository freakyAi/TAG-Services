import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'main.dart';

class InvokeTicket extends StatefulWidget {
  @override
  _InvokeTicketState createState() => _InvokeTicketState();
}

class _InvokeTicketState extends State<InvokeTicket> {
  final controller = new TextEditingController();
  var _select = {
    "CCTV Services",
    "Air Conditioner",
    "House Keeping",
    "Electrical Services",
    "Plumbing Services",
    "IT Services",
    "Vending Machines",
    "Paper Shredding Machines"
  };
  String summary;
  String details;
  var service;
  String path;
  var topic;
  // ignore: non_constant_identifier_names
  int token_no;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // ignore: non_constant_identifier_names
  var help_topic = {
    "CCTV Issue",
    "Feedback",
    "General Enquiry",
    "Report a Problem",
    "Access Issue"
  };

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;


  Widget _buildTopic(){
    return DropdownButtonFormField<String>(
        items: help_topic.map((String dropDownStringItem){
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Text(dropDownStringItem),
          );
        }).toList(),
        onChanged: (_value) {
          setState(() {
            this.topic = _value;
            print(topic);
          });
        },
        hint: Text(" - Select a Help Topic - "),
        value: topic,
      // ignore: missing_return
      validator: (String value){
        if(value == null){
          return "Required";
        }
      },
    );
  }

  Widget _buildServices(){
    return DropdownButtonFormField<String>(
      items: _select.map((String dropDownStringItem){
        return DropdownMenuItem<String>(
          value: dropDownStringItem,
          child: Text(dropDownStringItem),
        );
      }).toList(),
      onChanged: (_value) {
        setState(() {
          this.service = _value;
          print(service);
        });
      },
      hint: Text(" - Select a Service - "),
      value: service,
      // ignore: missing_return
      validator: (String value){
        if(value == null){
          return "Required";
        }
      },
    );
  }

  Widget _buildSummary(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Issue Summary"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        summary = str;
      },
    );
  }

  Widget _buildDetails(){
    return TextFormField(
      maxLines: 5,
      decoration: new InputDecoration(
          labelText: "Issue Details",

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
        details = str;
      },
    );
  }

  Widget _buildFile(){
    return Container(
      child: Padding(
          padding: const EdgeInsets.all(00.0),
          child : new Row(
            children: <Widget>[
              Text("Choose a file : "),
              SizedBox(width: 20.0),
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
    path = (await FilePicker.getFile()) as String;
    print(path);
  }

  @override
  Widget build(BuildContext context) {
    return new AnimatedContainer(
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
            child: Column(
              children: [
                SizedBox(height: 40,),
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
                          Text("Invoke New Ticket", style: TextStyle(fontSize: 18),)
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                        child: Form(
                          key: _formKey,
                          child: new Column(
                            children: <Widget>[
                              //SizedBox(height: 40,),
                              _buildTopic(),
                              SizedBox(height: 20.0),
                              _buildServices(),
                              SizedBox(height: 20.0),
                              _buildSummary(),
                              SizedBox(height: 20.0),
                              _buildDetails(),
                              SizedBox(height: 20.0),
                              _buildFile(),
                              SizedBox(height: 40.0),
                              InkWell(
                                onTap: () {
                                  if(!_formKey.currentState.validate()){
                                    return;
                                  }
                                  _formKey.currentState.save();
                                  Navigator.pushReplacement(context, new MaterialPageRoute(
                                      builder: (BuildContext context) => new MyHomePage() ),
                                  );
                                },
                                child :Container(
                                  height: 50,
                                  margin: EdgeInsets.symmetric(horizontal: 80),
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
                                    child: Text("Submit", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}