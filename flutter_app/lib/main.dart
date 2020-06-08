import 'package:flutter/material.dart';
import 'package:tagservices/invoke.dart';

//IMPORT PAGES
import 'about.dart';
import 'services.dart';
import 'menu.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAG Services',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'TAG Services'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String textToShow = "I Like Flutter";

  List<Menu> menu = [
    Menu(icon : "1" , text : "Invoke Token"),
    Menu(icon : "2" , text : "History")
  ];

  Widget ticketCard(menu){
    return Card(
      margin: EdgeInsets.all(30),

      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child : Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children : [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    menu.icon,
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.lightBlue[600],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    menu.text,
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.lightBlue[200],
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      )
      );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: new AppBar(
        title: new Text("TAG Services"),
        centerTitle: true,
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
            )
          ],
        ),
      ),
      body:  Column(
        children : [
        Row(
          // ignore: non_constant_identifier_names
          children: menu.map((Menu) => ticketCard(Menu)).toList(),
        ),
      ],
    ),
    );
  }
}
