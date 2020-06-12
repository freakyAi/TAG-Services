import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  int token_no;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var help_topic = {
    "CCTV Issue",
    "Feedback",
    "General Enquiry",
    "Report a Problem",
    "Access Issue"
  };

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

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New Ticket"),
      ),
      body: new Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: new Center(
          child: Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                _buildTopic(),
                SizedBox(height: 20.0),
                _buildServices(),
                SizedBox(height: 20.0),
                _buildSummary(),
                SizedBox(height: 20.0),
                _buildDetails(),
                SizedBox(height: 20.0),
                _buildFile(),
                SizedBox(height: 50.0),
                RaisedButton(
                  onPressed: (){
                    if(!_formKey.currentState.validate()){
                      return;
                    }
                    _formKey.currentState.save();
                    Fluttertoast.showToast(msg: "Token Submitted!");
                    /*Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new MyHomePage() ),
                    );*/
                  },
                  child: Text("Submit"),
                ),
              ],
            ),
          ),
        ),
      ),
      ),
    );
  }
}