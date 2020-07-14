import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'TicketDetails.dart';
import 'package:tagservices/Drawer.dart';


class TicketHistory extends StatefulWidget {
  @override
  _TicketHistoryState createState() => _TicketHistoryState();
}

class Menu {

  String id;
  String date;
  String status;

  Menu({ this.id, this.date, this.status});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu (
        id : json['ticket_id'],
        date : json['number'],
        status : 'Open'
    );
  }
}

class _TicketHistoryState extends State<TicketHistory> {

  var menuList;
  @override initState() {
    super.initState();
    //getTickets();
  }
  var ticketData;

  // ignore: missing_return
  Future<List<Menu>> getTickets() async {
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      ticketData = await http.get('http://192.168.43.167:8000/TAG/app/tickets.php?ticketNum=123456');
      print(ticketData.body);

      final  menuMap = jsonDecode(ticketData.body);
//      menu = Menu.fromJson(menuMap).toList();
      menu = menuMap.map<Menu>((iter)  => Menu.fromJson(iter)).toList();
//        menuMap.map<Menu>((json) => Photo.fromJson(json)).toList();
      //print(menuMap);
      return menu;
    } catch(e) {
      print('Got an error!\n ${e.toString()}');
    }
  }

  List<Menu> menu;


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
          // ignore: non_constant_identifier_names
          children: menu.map((Menu) => ticketCard(Menu)).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Ticket History"),
        ),
        drawer: DrawerMenu(),
        body: Container(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              right: BorderSide()
                            ),
                          ),
                          child:
                            Text("Filter",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                                right: BorderSide()
                            ),
                          ),
                          child:
                          Text(" Sort ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  width: double.infinity,
                  child: InkWell(
                    child: buildBody(context),
                    onTap: () {
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new TicketDetails())
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        )
//      ListView(
//        // ignore: non_constant_identifier_names
//        children: menu.map((Menu) => ticketCard(Menu)).toList(),
//      )
    );
  }
}
