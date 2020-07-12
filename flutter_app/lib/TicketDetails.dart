import 'package:flutter/material.dart';

class TicketDetails extends StatefulWidget {
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Ticket Details"),
      ),
      body: Column(
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
                                        Text("2"),
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
                                        Text("20/12/2019"),
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
                                        Text("Approved"),
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
                                          Text("Assigned Date : ", style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                          SizedBox(width: 20,),
                                          Text("20/12/2019"),
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
                                          Text("Approved"),
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
                ),
            ],
      )
    );
  }
}
