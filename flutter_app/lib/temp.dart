import 'package:flutter/material.dart';
import 'package:tagservices/getintouch.dart';
import 'package:tagservices/invoke.dart';

//IMPORT PAGES
import 'services.dart';
//import 'menu.dart';
import 'login.dart';

void main(){
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
        primarySwatch: Colors.orange,
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


class Menu {

  String id;
  String date;
  String status;

  Menu({ this.id, this.date, this.status});

}

class _MyHomePageState extends State<MyHomePage> {

  List<Menu> menu = [
    Menu(id : "1" , date : "18/06/2020", status:"Pending"),
    Menu(id : "2" , date : "20/06/2020", status:"Approved"),
    Menu(id : "3" , date : "21/06/2020", status:"Completed")
    //Menu(icon : "2" , text : "History")
  ];

  Widget ticketCard(menu) {
    return Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width,
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
//		return Card(
//      margin: EdgeInsets.all(30),
//
//      child: Padding(
//        padding: const EdgeInsets.all(40.0),
//        child : Container(
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            //crossAxisAlignment: CrossAxisAlignment.stretch,
//            children : [
//              Column(
//                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                children: <Widget>[
//                  Text(
//                    menu.icon,
//                    style: TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.lightBlue[600],
//                    ),
//                  ),
//                  SizedBox(height: 5.0),
//                  Text(
//                    menu.text,
//                    style: TextStyle(
//                      fontSize: 12.0,
//                      color: Colors.lightBlue[200],
//                    ),
//                  ),
//                ],
//              ),
//            ],
//          ),
//        )
//      )
//    );

//		children: <Widget>[
//			Expanded(
//					child: SizedBox(
//						height: 210,
//						child: ListTile(
//							title: Text('AC Number 2'),
//							subtitle: Text('Ticket Number: 123456'),
//							leading: Icon(
//									Icons.ac_unit,
//									color: Colors.blue[500]
//							),
//						),
//					)
//			)
//		],
//
//		return ListTile(
//			title: Text('AC Number 2'),
//			subtitle: Text('Ticket Number: 123456'),
//			leading: Icon(
//			Icons.ac_unit,
//			color: Colors.blue[500]
//			),
//		);

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
                    builder: (BuildContext context) => new GetInTouch() )
                );
              },
            ),
            new ListTile(
              title: new Text("New Ticket"),
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
                //prefs.setInt('login_flag',0);
                Navigator.of(context).pop();
                Navigator.push(context, new MaterialPageRoute(
                    builder: (BuildContext context) => new LoginPage() )
                );
              },
            )
          ],
        ),
      ),
			body: ListView(
        // ignore: non_constant_identifier_names
        children: menu.map((Menu) => ticketCard(Menu)).toList(),
    )
    );
  }
}
