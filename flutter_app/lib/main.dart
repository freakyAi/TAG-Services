import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//IMPORT PAGES
import 'about.dart';
import 'services.dart';
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


class Menu {

  String id;
  String date;
  String status;

  Menu({ this.id, this.date, this.status});

  Menu.fromJson(Map<String, dynamic> json)
      : id = json['ticked'],
        date = json['data'],
        status = 'Open';
}

class _MyHomePageState extends State<MyHomePage> {
  var menuList;
  @override initState() {
    super.initState();
    //getTickets();
  }
  var ticketData;

  Future<List<Menu>> getTickets() async {
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      ticketData = await http.get('http://192.168.43.111:8000/TAG/app/tickets.php?ticketNum=123456');
      print(ticketData.body);

      Map menuMap = jsonDecode(ticketData);
      menu = Menu.fromJson(menuMap) as List<Menu>;
      print(menu);
      return menu;
    } catch(e) {
      print('Got an error! statusCOde: ${ticketData.statusCode}\n ${e.toString()}');
    }
  }

  List<Menu> menu = [
    Menu(id : "1" , date : "18/06/2020", status:"Pending"),
    Menu(id : "2" , date : "20/06/2020", status:"Approved"),
    Menu(id : "3" , date : "21/06/2020", status:"Completed")
    //Menu(icon : "2" , text : "History")
  ];

  Widget ticketCard(menu) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              Text("Ticket ID : ", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                              SizedBox(width: 60,),
                              Text(menu.id),
                            ],
                          ),
                          SizedBox(height: 10,),
                          new Row(
                            children: <Widget>[
                              Text("Invoked Date : ", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                              SizedBox(width: 20,),
                              Text(menu.date),
                            ],
                          ),
                          SizedBox(height: 10,),
                          new Row(
                            children: <Widget>[
                              Text("Status : ", style: TextStyle(color: Colors
                                  .black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                              SizedBox(width: 20,),
                              Text(menu.status),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ]
            ),
          ),
        )
    );
  }

  Widget buildBody(BuildContext context) {
    getTickets();
    return FutureBuilder<List<Menu>> (
      future: getTickets(),
      builder: (context, snapshot) {
        if(snapshot.hasError) print(snapshot.error);

        //Show a progress bar until data loads
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());
        return ListView(
          children: menu.map((Menu) => ticketCard(Menu)).toList(),
        );
      },
    );
  }

// This works as well!!
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
      body: buildBody(context)
//      ListView(
//        // ignore: non_constant_identifier_names
//        children: menu.map((Menu) => ticketCard(Menu)).toList(),
//      )
    );
  }

  _save(String loginToken) async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'loginToken';
    final value = loginToken;
    prefs.setString(key,value);
  }
}
