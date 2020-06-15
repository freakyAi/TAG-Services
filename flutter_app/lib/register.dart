import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKeyRegister = GlobalKey<FormState>();
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;
  String rePassword;
  String _timezone = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String timezone;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      timezone = await FlutterNativeTimezone.getLocalTimezone();
    } on PlatformException {
      timezone = 'Failed to get the timezone.';
    }

    if (!mounted) return;

    setState(() {
      _timezone = timezone;
    });
  }


  Widget _buildFirstName(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "First Name"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        firstName = str;
      },
    );
  }

  Widget _buildLastName(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Last Name",
      ),
      // ignore: missing_return
      validator: (String details){
        if(details.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        lastName = str;
      },
    );
  }

  Widget _buildPhoneNumber(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "Phone Number",
      ),
      maxLength: 10,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      // ignore: missing_return
      validator: (String details){
        if(details.isEmpty){
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

  Widget _buildPassword(){
    return TextFormField(
      obscureText: true,
      decoration: new InputDecoration(
          labelText: "Create a Password"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
      },
      onChanged: (String str){
        password = str;
      },
    );
  }

  Widget _buildRePassword(){
    return TextFormField(
      obscureText: true,
      decoration: new InputDecoration(
          labelText: "Confirm New Password"
      ),
      // ignore: missing_return
      validator: (String value){
        if(value.isEmpty){
          return "Required";
        }
        else if(value != password){
          return "Password doesn't match";
        }
      },
      onSaved: (String str){
        rePassword = str;
      },
    );
  }

  Widget _buildTimeZone(){
    return  Text('Timezone : $_timezone\n',);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Registration"),
      ),
      body: new Container(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Form(
            key: _formKeyRegister,
            child: SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  new Row(
                    children: <Widget>[
                      new Flexible(child: _buildFirstName()),
                      SizedBox(width: 20),
                      new Flexible(child: _buildLastName()),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  _buildPhoneNumber(),
                  SizedBox(height: 20.0),
                  _buildEmail(),
                  SizedBox(height: 20.0),
                  _buildTimeZone(),
                  SizedBox(height: 20.0),
                  _buildPassword(),
                  SizedBox(height: 20.0),
                  _buildRePassword(),
                  SizedBox(height: 50.0),
                  RaisedButton(
                    onPressed: (){
                      if(!_formKeyRegister.currentState.validate()){
                        return;
                      }
                      _formKeyRegister.currentState.save();
                      Fluttertoast.showToast(msg: "Registered!");
                      Navigator.pushReplacement(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new MyHomePage() ),
                      );
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
