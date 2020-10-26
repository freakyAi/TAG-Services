import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'TicketHistory.dart';
import 'constants.dart';
import 'main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ticketData {
  String id;
  String uuid;
  String service;
  String invoked_date;
  String email;
  String details;
  String agent_id;

  ticketData(
      {this.id,
      this.uuid,
      this.service,
      this.invoked_date,
      this.email,
      this.details,
      this.agent_id});

  factory ticketData.fromJson(Map<String, dynamic> json) {
    return ticketData(
      id: json['id'],
      uuid: json['uuid'],
      service: json['service'],
      // invoked_date: json['invoked_date'],
      invoked_date:
          DateFormat('d MMM, y').format(DateTime.parse(json['invoked_date'])),
      email: json['email_id'],
      details: json['details'],
      agent_id: json['agent_id'],
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
  Future<ticketData> getTicketData() async {
    var ticketResp;
    try {
      //change the ip address to match your laptop's ip address
      //also change port number of wamp to 8000 through its settings
      ticketResp = await http
          .get('$localhost/TAG/mobile_app/tickets.php?ticketId=' + widget.ticketId);
      // log("Ticket details: " + ticketResp.body);

      var ticketRespMap = jsonDecode(ticketResp.body);
      // menu = Menu.fromJson(menuMap).toList();
      // var ticketInfo = ticketRespMap.map<ticketData>((ticket) => ticketData.fromJson(ticket)).toList(); // (ticketData.fromJson(ticketRespMap));
      var ticketInfo = ticketData
          .fromJson(ticketRespMap); // (ticketData.fromJson(ticketRespMap));
      // menuMap.map<Menu>((json) => Photo.fromJson(json)).toList();
      log("Logging " + ticketRespMap.toString());
      return ticketInfo;
    } catch (e) {
      log('Got an error!\n ${e.toString()}');
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
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20, 0, 50, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        print(widget.ticketId + " is it");
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    new MyHomePage(
                                      pageController: 3,
                                    )));
                      }),
                  //SizedBox(width: 50,),
                  Column(
                    children: [
                      Text(
                        "Ticket Details",
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Column()
                ],
              ),
            ),
            //SizedBox(height: 0,),
            Expanded(
                child: FutureBuilder(
                    future: getTicketData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Text('Error occured!');
                      }
                      //Show a progress bar until data loads
                      // ignore: missing_return
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());

                      var ticketInfo = snapshot.data;
                      double titleWidth = 150;
                      double titleFontSize = 14.5;
                      return Column(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Card(
                                elevation: 5,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            new Row(
                                              children: <Widget>[
                                                Container(
                                                  width: titleWidth,
                                                  child: Text(
                                                      "Ticket ID : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: titleFontSize,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                Text(ticketInfo.uuid),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                Container(
                                                  width: titleWidth,
                                                  child: Text(
                                                      "Invoked Date : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: titleFontSize,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                Text(ticketInfo
                                                    .invoked_date),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                Container(
                                                  width: titleWidth,
                                                  child: Text(
                                                      "Service Type : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: titleFontSize,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                Text(ticketInfo.service),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                Container(
                                                  width: titleWidth,
                                                  child: Text("Email-id : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: titleFontSize,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                Text(ticketInfo.email),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            new Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  width: titleWidth,
                                                  child: Text("Details : ",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black,
                                                          fontSize: titleFontSize,
                                                          fontWeight:
                                                              FontWeight
                                                                  .bold)),
                                                ),
                                                Container(
                                                  width: 160,
                                                  child: Text(
                                                    ticketInfo.details,
                                                    maxLines: 10,
                                                    overflow: TextOverflow
                                                        .ellipsis,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            FutureBuilder(
                                              future: getAgentInfo(ticketInfo.agent_id),
                                              // ignore: missing_return
                                              builder: (context, snapshot) {
                                                if (!snapshot.hasData)
                                                  return Center(
                                                      child: CircularProgressIndicator());
                                                var agentData = snapshot.data;
                                                if (snapshot.hasData)
                                                  return Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                      //crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: <Widget>[
                                                            //TODO agent details title
                                                            new Row(
                                                              children: <Widget>[
                                                                Container(
                                                                  width: titleWidth,
                                                                  child: Text("Agent Name : ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: titleFontSize,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                                ),
                                                                Text(agentData["name"]),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 10,
                                                            ),
                                                            new Row(
                                                              children: <Widget>[
                                                                Container(
                                                                  width: titleWidth,
                                                                  child: Text(
                                                                      "Agent Contact No .: ",
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: titleFontSize,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                                ),
                                                                Text(agentData["mobile_no"]),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ]);
                                              },
                                            )
                                          ],
                                        ),
                                      ]),
                                )),
                          ),
                          // FutureBuilder(
                          //   future: getAgentInfo(ticketInfo.agent_id),
                          //   // ignore: missing_return
                          //   builder: (context, snapshot) {
                          //     if (!snapshot.hasData)
                          //       return Center(
                          //           child: CircularProgressIndicator());
                          //     var agentData = snapshot.data;
                          //     double titleWidth = 170;
                          //     if (snapshot.hasData)
                          //       return Container(
                          //           width: MediaQuery.of(context).size.width,
                          //           padding: EdgeInsets.symmetric(
                          //               horizontal: 10, vertical: 10),
                          //           child: Card(
                          //             elevation: 5,
                          //             shape: RoundedRectangleBorder(
                          //                 borderRadius:
                          //                     BorderRadius.circular(10)),
                          //             child: Container(
                          //               decoration: BoxDecoration(
                          //                   borderRadius: BorderRadius.circular(10),
                          //                   gradient: LinearGradient(
                          //                       begin: Alignment.topCenter,
                          //                       colors: [
                          //                         Colors.blue[300],
                          //                         Colors.blue[200],
                          //                         Colors.blue[100]
                          //                       ]
                          //                   )
                          //               ),
                          //               width:
                          //                   MediaQuery.of(context).size.width,
                          //               padding: EdgeInsets.symmetric(
                          //                   horizontal: 10, vertical: 10),
                          //               child: Row(
                          //                   mainAxisAlignment:
                          //                       MainAxisAlignment.spaceBetween,
                          //                   //crossAxisAlignment: CrossAxisAlignment.start,
                          //                   children: <Widget>[
                          //                     Row(
                          //                       //crossAxisAlignment: CrossAxisAlignment.start,
                          //                       children: <Widget>[
                          //                         Column(
                          //                           crossAxisAlignment:
                          //                               CrossAxisAlignment
                          //                                   .start,
                          //                           children: <Widget>[
                          //                             //TODO agent details title
                          //                             new Row(
                          //                               children: <Widget>[
                          //                                 Container(
                          //                                   width: titleWidth,
                          //                                   child: Text("Agent Name : ",
                          //                                       style: TextStyle(
                          //                                           color: Colors
                          //                                               .black,
                          //                                           fontSize: 16,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .bold)),
                          //                                 ),
                          //                                 Text(agentData["name"]),
                          //                               ],
                          //                             ),
                          //                             SizedBox(
                          //                               height: 10,
                          //                             ),
                          //                             new Row(
                          //                               children: <Widget>[
                          //                                 Container(
                          //                                   width: titleWidth,
                          //                                   child: Text(
                          //                                       "Agent Contact No .: ",
                          //                                       style: TextStyle(
                          //                                           color: Colors
                          //                                               .black,
                          //                                           fontSize: 16,
                          //                                           fontWeight:
                          //                                               FontWeight
                          //                                                   .bold)),
                          //                                 ),
                          //                                 Text(agentData["mobile_no"]),
                          //                               ],
                          //                             ),
                          //                           ],
                          //                         ),
                          //                       ],
                          //                     ),
                          //                   ]),
                          //             ),
                          //           ));
                          //   },
                          // ),
                        ],
                      );
                    })),
          ],
        ),
      ),
    );
  }

  Future getAgentInfo(agentId) async {
      var resp = await http.get('$localhost/TAG/mobile_app/tickets.php?agentId=$agentId');
      log("Agent data: "+resp.body);
      //
      var respJson = jsonDecode(resp.body);
      log(respJson.toString());
      return respJson;
  }
}
