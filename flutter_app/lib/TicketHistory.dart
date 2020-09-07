import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'TicketDetails.dart';
import 'storedData.dart';


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

  var menuList,ticketData; int userid;
  List<Menu> menu;

  @override initState() {
    super.initState();
    //getTickets();
    storedData dat = storedData();
    dat.getInt('userid').then((value) {
      userid = value;
      print("\nuserid: "+userid.toString()+"\n");
    });
  }

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  // ignore: missing_return
  Future<List<Menu>> getTickets() async {
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      ticketData = await http.get('http://192.168.43.167:8000/TAG/app/tickets.php?userid='+userid.toString());
      print("Tickt data: "+ticketData.body);

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

  Widget ticketCard(menu) {
    return GestureDetector(
      onTap: () {
        print(menu.id);
        Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new TicketDetails(menu.id))
        );
      },
      child: Container(
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
                ],
            ),
          ),
        ),
    ),
    );
  }

  Widget buildBody(BuildContext context) {
    //getTickets();
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
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isDrawerOpen?20:0)
        ),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(20.0)
            ),
            child: InkWell(
              onTap: () {
                setState(() {
                  xOffset = 0;
                  yOffset = 0;
                  scaleFactor = 1;
                  isDrawerOpen = false;
                });
              },
              child: Column(
                children: [
                  SizedBox(height: 50,),
                  Container(
                    margin: EdgeInsets.fromLTRB(20,0,50,0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen ? IconButton(
                            icon: Icon(Icons.arrow_back_ios), onPressed: (){
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        }
                        ): IconButton(icon: Icon(Icons.menu), onPressed: (){
                          setState(() {
                            xOffset = 230;
                            yOffset = 150;
                            scaleFactor = 0.6;
                            isDrawerOpen = true;
                          });
                        }),
                        //SizedBox(width: 50,),
                        Column(
                          children: [
                            Text("Ticket History", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                          ],
                        ),
                        Column(),
                      ],
                    ),
                  ),
                  //SizedBox(height: 0,),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              width: double.infinity,
                              child: InkWell(
                                child: buildBody(context),
//                                onTap: () {
//                                  Navigator.push(context, new MaterialPageRoute(
//                                      builder: (BuildContext context) => new TicketDetails())
//                                  );
//                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
