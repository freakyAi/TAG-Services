import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//IMPORT PAGES
import 'about.dart';
import 'services.dart';
import 'TicketStatus.dart';
import 'invoke.dart';
import 'login.dart';


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAG Services',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TAG Services'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  Widget _buildTicketStatus(String id,String date,String status){
    return Container(
        height: 100,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
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
            new Row(
              children: <Widget>[
                Text("Ticket ID : ",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(width: 20,),
                Text(
                  "$id"
                ),
              ],
            ),
            SizedBox(height: 10,),
            new Row(
              children: <Widget>[
                Text("Invoked Date : ",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(width: 20,),
                Text("$date"),
              ],
            ),
            SizedBox(height: 10,),
            new Row(
              children: <Widget>[
                Text("Status : ",style: TextStyle(color: Colors.black, fontSize: 16,fontWeight: FontWeight.bold)),
                SizedBox(width: 20,),
                Text("$status"),
              ],
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TAG Services"),
      ),
      drawer: new Drawer(
        child: ListView(
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
              title: new Text("Services"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new Services() )
                );
              },
            ),
            new ListTile(
              title: new Text("About Us"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutUS() )
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
      ),
      body: new Container(
        child : Padding(
          padding: const EdgeInsets.all(40.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  _buildTicketStatus("1","18/06/2020","Pending"),
                  SizedBox(height: 20,),
                  _buildTicketStatus("2", "19/06/2020", "Approved")
                ],
              )
            )
        ),
      )
    );
  }

  _save(String loginToken) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'loginToken';
    final value = loginToken;
    prefs.setString(key,value);
  }
}
