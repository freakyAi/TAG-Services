import 'package:flutter/material.dart';

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
  String comment;
  var service;
  int token_no;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Ticket"),
      ),
      body: new Container(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: new Center(
          child: new Column(
            children: <Widget>[
              new DropdownButton<String>(
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
                hint: Text("Select a Service"),
                value: service,
                ),
              SizedBox(height: 20.0),
              new TextField(
                decoration: new InputDecoration(
                  hintText: "Comment"
                ),
                onSubmitted: (String str){
                  setState(() {
                    comment = str;
                  });
                },
              ),
              SizedBox(height: 50.0),
              RaisedButton(
                  onPressed: (){
                    
                  },
                  child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}