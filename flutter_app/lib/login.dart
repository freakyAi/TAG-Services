import 'register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'FadeAnimation.dart';
//import 'register.dart';
import 'main.dart';


class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAG Services',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(title: 'TAG Services'),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      body: new Container(
        padding: EdgeInsets.symmetric(vertical: 0.0),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900],
              Colors.blue[500],
              Colors.blue[400]
            ]
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80.0),
            Padding(
                padding : EdgeInsets.all(20.0),
                child : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(2,Text("Login", style: TextStyle(color: Colors.white, fontSize: 40.0, fontFamily: "Arial"),)),
                    SizedBox(height: 10.0,),
                  ],
                )
              ),
            Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(500.0), topRight: Radius.circular(0)),
                    boxShadow: [BoxShadow(
                        color: Color.fromRGBO(120, 95, 27, .3),
                        blurRadius: 20.0,
                        offset: Offset(0, -3)
                    )]
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(25.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 60,),
                          FadeAnimation(1,Container(
                            padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Color.fromRGBO(120, 95, 27, .3),
                                    blurRadius: 20.0,
                                    offset: Offset(0, 5)
                                )]
                            ),
                            child: Column(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    onChanged: (String str){
                                      setState(() {
                                        username = str;
                                        print(username);
                                      });
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Email ID",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border(bottom: BorderSide(color: Colors.grey[200]))
                                  ),
                                  child: TextField(
                                    obscureText: true,
                                    onChanged: (String str) {
                                      setState(() {
                                        password = str;
                                        print(password);
                                      });
                                    },
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        hintStyle: TextStyle(color: Colors.grey),
                                        border: InputBorder.none
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                Container(
                                  child: Text("Forgot Password?",
                                    style: TextStyle(color: Colors.grey),
                                  ),

                                ),
                                SizedBox(height: 30,),
                                InkWell(
                                  onTap: checkCredentials,
                                  child :Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(horizontal: 100),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(40),
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
                                      child: Text("Login", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30,),
                                InkWell(
                                  onTap: () {
                                    //Navigator.of(context).pop();
                                    Navigator.push(context, new MaterialPageRoute(
                                    builder: (BuildContext context) => new RegisterPage())
                                      );
                                    },
                                  child: Text("New member?",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                )
                              ],
                            ),
                          ),
                         )
                       ],
                   ),
                    ),
                 ),
            )
            )
          ],
        ),
      ),
    );
  }


  void checkCredentials(){
    if(username == "aju" && password == "123"){
      //FlutterToast.showToast(child: Text("Login Successful"));
      _save('true');
      Navigator.pushReplacement(context, new MaterialPageRoute(
          builder: (BuildContext context) => new MyHomePage(pageController: 1,) )
      );
    }
    else{
      //Fluttertoast.showToast(msg: "Invalid Credentials");
    }
  }

  _save(String loginToken) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'loginToken';
    final value = loginToken;
    prefs.setString(key,value);
  }
}

