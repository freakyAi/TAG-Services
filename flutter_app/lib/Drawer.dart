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
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Colors.orange[900],
                  Colors.orange[400],
                  Colors.orange[400]
                ]
              )
            ),
            child: new UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(),
                accountName: new Text("Ajju"),
                accountEmail: new Text("adharashive@gmail.com")
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: <Widget>[
                new ListTile(
                  title: new Text("Home"),
                  onTap: () {
                    //Navigator.of(context).pop();
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new MyHomePage() )
                    );
                  },
                ),
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
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
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
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
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
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
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
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
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
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
                ),
                new Divider(
                  thickness: 1,
                  height: 0,
                  color: Colors.amber,
                ),
              ],
            ),
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

