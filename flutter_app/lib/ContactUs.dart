import 'package:flutter/material.dart';
import 'main.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {

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
        appBar: new AppBar(title: new Text("Contact Us"),) ,
        body: SingleChildScrollView(
          child: Container(
              child : new Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(20)),
                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(15)),
                      Text("GET IN TOUCH", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),)
                    ],
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                              color: Color.fromRGBO(120, 95, 27, .3),
                              blurRadius: 20.0,
                              offset: Offset(0, 5)
                          )]
                      ),
                      child: Form(
                        key: _formKeyContact,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
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
                              RaisedButton(
                                onPressed: (){
                                  if(!_formKeyContact.currentState.validate()){
                                    return;
                                  }
                                  _formKeyContact.currentState.save();
                                  //Fluttertoast.showToast(msg: "Contacted!");
                                  Navigator.pushReplacement(context, new MaterialPageRoute(
                                      builder: (BuildContext context) => new MyHomePage() ),
                                  );
                                },
                                child: Text("MAKE A RESERVATION"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )
          ),
        )
    );
  }
}

