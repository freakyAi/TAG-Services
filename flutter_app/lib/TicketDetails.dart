import 'package:flutter/material.dart';

import 'TicketHistory.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ticketData {
  String id;
  String number;
  String serviceType;
  String createdDate;
  String status;

  ticketData({ this.id, this.number, this.serviceType, this.createdDate, this.status});

  factory ticketData.fromJson(Map<String, dynamic> json) {
    return ticketData (
        id : json['ticket_id'],
        number : json['number'],
        serviceType: 'AC',
        createdDate: json['created'],
        status : 'Open'
    );
  }
}

class TicketDetails extends StatefulWidget {
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
  String ticketId;
//  TicketDetails({Key key, this.ticketId}) : super(key: key);
TicketDetails(this.ticketId);
}

class _TicketDetailsState extends State<TicketDetails> {
  var ticket;

  Future<ticketData> getTicketData() async{
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      var ticketResp = await http.get('http://192.168.43.167:8000/TAG/app/tickets.php?ticketId='+widget.ticketId);
      print("Ticket data: "+ ticketResp.body);

     final ticketRespMap = jsonDecode(ticketResp.body);
//      menu = Menu.fromJson(menuMap).toList();
      ticket = ticketData.fromJson(ticketRespMap);
//        menuMap.map<Menu>((json) => Photo.fromJson(json)).toList();
      //print(menuMap);
      return ticket;
    } catch(e) {
      print('Got an error!\n ${e.toString()}');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getTicketData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
        child: Column(
          children: [
            SizedBox(height: 50,),
            Container(
              margin: EdgeInsets.fromLTRB(20,0,50,0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      print(widget.ticketId+" is it");
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new MyHomePage(pageController: 3,))
                      );
                    }
                  ),
                  //SizedBox(width: 50,),
                  Column(
                    children: [
                      Text("Ticket Details", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)
                    ],
                  ),
                  Column()
                ],
              ),
            ),
            //SizedBox(height: 0,),
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              colors: [
                                                Colors.blue[800],
                                                Colors.blue[500],
                                                Colors.blue[300]
                                              ]
                                          )
                                      ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                              child: FutureBuilder<ticketData> (
                                future: getTicketData(),
                                // ignore: missing_return
                                builder: (context, snapshot) {
                                  if(snapshot.hasError) print(snapshot.error);
                                  //Show a progress bar until data loads
                                  // ignore: missing_return
                                  if(!snapshot.hasData) return Center(child: CircularProgressIndicator());

                                  if(snapshot.hasData) {
                                        return Row(
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
                                                      Text(ticket.number),
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
                                                      Text(ticket.createdDate),
                                                    ],
                                                  ),
                                                  SizedBox(height: 10,),
                                                  new Row(
                                                    children: <Widget>[
                                                      Text("Service Type : ", style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold)),
                                                      SizedBox(width: 20,),
                                                      Text(ticket.serviceType),
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
                                                      Text(ticket.status),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ]
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        )
                        ),
                      )
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          //padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              colors: [
                                                Colors.blue[800],
                                                Colors.blue[500],
                                                Colors.blue[300]
                                              ]
                                          )
                                      ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
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
                                              Text("Agent Name : ", style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                              SizedBox(width: 60,),
                                              Text("Harold"),
                                            ],
                                          ),
                                          SizedBox(height: 10,),
                                          new Row(
                                            children: <Widget>[
                                              Text("Agent Contact No .: ", style: TextStyle(color: Colors
                                                  .black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                              SizedBox(width: 20,),
                                              Text("9881266239"),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ]
                            ),
                          ),
                        ),
                      )
                  ),
                         ))   ],
              )
            ),
          ],
        ),
      ),
    );
  }
}



//                          child: Row(
//                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                              //crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Row(
//                                  //crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Column(
//                                      crossAxisAlignment: CrossAxisAlignment.start,
//                                      children: <Widget>[
//                                        new Row(
//                                          children: <Widget>[
//                                            Text("Ticket ID : ", style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.bold)),
//                                            SizedBox(width: 60,),
//                                            Text(ticket.number),
//                                          ],
//                                        ),
//                                        SizedBox(height: 10,),
//                                        new Row(
//                                          children: <Widget>[
//                                            Text("Invoked Date : ", style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.bold)),
//                                            SizedBox(width: 20,),
//                                            Text(ticket.createdDate),
//                                          ],
//                                        ),
//                                        SizedBox(height: 10,),
//                                        new Row(
//                                          children: <Widget>[
//                                            Text("Service Type : ", style: TextStyle(
//                                                color: Colors.black,
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.bold)),
//                                            SizedBox(width: 20,),
//                                            Text(ticket.serviceType),
//                                          ],
//                                        ),
//                                        SizedBox(height: 10,),
//                                        new Row(
//                                          children: <Widget>[
//                                            Text("Status : ", style: TextStyle(color: Colors
//                                                .black,
//                                                fontSize: 16,
//                                                fontWeight: FontWeight.bold)),
//                                            SizedBox(width: 20,),
//                                            Text(ticket.status),
//                                          ],
//                                        ),
//                                      ],
//                                    ),
//                                  ],
//                                ),
//                              ]
//                          ),