import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tagservices/services.dart';

import 'TicketHistory.dart';
import 'getintouch.dart';
import 'invoke.dart';
import 'login.dart';
import 'main.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child : ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
              accountName: new Text("Ajju"),
              accountEmail: new Text("adharashive@gmail.com")
          ),
          new ListTile(
            title: new Text("Home"),
            onTap: () {
              //Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new MyHomePage() )
              );
            },
          ),
          new ListTile(
            title: new Text("Tickets"),
            onTap: () {
              //Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new TicketHistory() )
              );
            },
          ),
          new ListTile(
            title: new Text("Services"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new Services() )
              );
            },
          ),
          new ListTile(
            title: new Text("Get in Touch"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new GetInTouch() )
              );
            },
          ),
          new ListTile(
            title: new Text("Invoke Ticket"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new InvokeTicket() )
              );
            },
          ),
          new ListTile(
            title: new Text("Logout"),
            onTap: () {
              _save('false');
              Navigator.of(context).pop();
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new LoginPage() )
              );
            },
          )
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

