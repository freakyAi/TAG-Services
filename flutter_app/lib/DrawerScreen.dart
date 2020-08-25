import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login.dart';
import 'main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            colors: [
              Colors.blue[900],
              Colors.blue[800],
              Colors.blue[500]
            ]
          )
        ),
      child: Column(
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          width: 50,
                          height:50,
                          child: CircleAvatar()
                      ),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Ajju",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          SizedBox(height: 8,),
                          Text(
                            "adharashive@gmail.com",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 40,),
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.home,color: Colors.white,size: 20,),
                        title: new Text("Home",style: TextStyle(color: Colors.white,),),
                        onTap: () {
                          //Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new MyHomePage(pageController: 1,) )
                          );
                        },
                      ),
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.ticketAlt,color: Colors.white,size: 20,),
                        title: new Text("Invoke Ticket",style: TextStyle(color: Colors.white,),),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new MyHomePage(pageController: 2,))
                          );
                        },
                      ),
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.history,color: Colors.white,size: 20,),
                        title: new Text("Ticket History",style: TextStyle(color: Colors.white,),),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new MyHomePage(pageController: 3,))
                          );
                        },
                      ),
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.servicestack,color: Colors.white,size: 20,),
                        title: new Text("Services",style: TextStyle(color: Colors.white,),),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new MyHomePage(pageController: 4,))
                          );
                        },
                      ),
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.phone,color: Colors.white,size: 20,),
                        title: new Text("Get In Touch",style: TextStyle(color: Colors.white,),),
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new MyHomePage(pageController: 5,) )
                          );
                        },
                      ),
                      new ListTile(
                        leading: Icon(FontAwesomeIcons.arrowLeft,color: Colors.white,size: 20,),
                        title: new Text("Logout",style: TextStyle(color: Colors.white),),
                        onTap: () {
                          _save('false');
                          Navigator.of(context).pop();
                          Navigator.push(context, new MaterialPageRoute(
                              builder: (BuildContext context) => new LoginPage() )
                          );
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _save(String loginToken) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'loginToken';
    final value = loginToken;
    prefs.setString(key,value);
  }
}
