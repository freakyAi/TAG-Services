import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'TicketDetails.dart';
import 'constants.dart';
import 'storedData.dart';


class TicketHistory extends StatefulWidget {
  @override
  _TicketHistoryState createState() => _TicketHistoryState();
}

class Menu {

  String id;
  String uuid;
  String date;
  String service;
  bool is_closed;

  Menu({ this.id, this.uuid, this.date, this.service, this.is_closed});

  factory Menu.fromJson(Map<String, dynamic> json) {
    return Menu (
        id : json['id'],
        uuid: json['uuid'],
        date : json['invoked_date'],
        service : json['service'],
        is_closed: json['is_closed']=='1', //convert '1' or '0' to boolean
    );
  }
}

class _TicketHistoryState extends State<TicketHistory> {

  var ticketData;
  int userid;
  List<Menu> menu;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  @override initState() {
    super.initState();
    //getTickets();
    // storedData dat = storedData();
    // dat.getInt('userid').then((value) {
    //   userid = value;
    //   print("\nuserid: "+userid.toString()+"\n");
    // });
  }

  // ignore: missing_return
  Future<List<Menu>> getTickets() async {
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String clientId = prefs.getString('client_id');
      ticketData = await http.get('$localhost/TAG/mobile_app/tickets.php?clientid=$clientId'); //TODO change it to clientid from prefs
      // log("Tickt data: "+ticketData.body);

      final  menuMap = jsonDecode(ticketData.body);
      menu = menuMap.map<Menu>((iter)  => Menu.fromJson(iter)).toList();
      log(menu[0].is_closed.toString());
      return menu;
    } catch(e) {
      print('Got an error!\n ${e.toString()}');
    }
  }

  Widget ticketCard(Menu data) {
    //this code used to skip tickets older than 2 days
    // DateTime now = DateTime.now();
    // Duration difference = now.difference(parsedDate);
    // if(difference.inHours > 48) {
    //   return Container();
    // }
    // skip ticket if it is closed
    if(data.is_closed)
      return Container();

    DateTime parsedDate = DateTime.parse(data.date);
    String dateString = DateFormat('d MMM, y').format(parsedDate);
    return GestureDetector(
      onTap: () {
        print(data.id);
        Navigator.push(context, new MaterialPageRoute(
            builder: (BuildContext context) => new TicketDetails(data.id))
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
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    colors: [
                      Colors.blue[200],
                      Colors.blue[100],
                      Colors.blue[100]
                    ]
                )
            ),
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
                              Container(
                                width: 130,
                                child: Text("Ticket ID : ", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                              ),
                              Text(data.uuid),
                            ],
                          ),
                          SizedBox(height: 10,),
                          new Row(
                            children: <Widget>[
                              Container(
                                width: 130,
                                child: Text("Invoked Date : ", style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                              ),
                              Text(dateString),
                            ],
                          ),
                          SizedBox(height: 10,),
                          new Row(
                            children: <Widget>[
                              Container(
                                width: 130,
                                child: Text("Service : ",
                                    style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                width: 130,
                                child: Text(
                                  data.service,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
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

  Widget buildBody() {
    //getTickets();
    return FutureBuilder<List<Menu>> (
      future: getTickets(),
      builder: (context, snapshot) {
        if(snapshot.hasError) log(snapshot.error);

        //Show a progress bar until data loads
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator());

        return ListView(
          // ignore: non_constant_identifier_names
          children: snapshot.data.map((ticketData) => ticketCard(ticketData)).toList(),
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
                            Text(
                              // "Ticket History",
                              "Active Tickets", //TODO uncomment above line and comment this one
                              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
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
                              child: buildBody(),
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
