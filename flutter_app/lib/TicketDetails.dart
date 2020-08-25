import 'package:flutter/material.dart';
import 'package:tagservices/main.dart';

import 'TicketHistory.dart';

class TicketDetails extends StatefulWidget {
  @override
  _TicketDetailsState createState() => _TicketDetailsState();
}

class _TicketDetailsState extends State<TicketDetails> {

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
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new MyHomePage(pageController: 3,))
                      );
                    }
                  ),
                  //SizedBox(width: 50,),
                  Column(
                    children: [
                      Text("Ticket Details", style: TextStyle(fontSize: 18),)
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
                                            Text("Service Type : ", style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                            SizedBox(width: 20,),
                                            Text("A/C Repair"),
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
                      )
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
