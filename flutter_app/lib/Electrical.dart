import 'package:flutter/material.dart';

class Electrical extends StatefulWidget {
  @override
  _ElectricalState createState() => _ElectricalState();
}

class _ElectricalState extends State<Electrical> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Electrical Services"),
        ),
        body: Container(
          child: Container(
              child: SingleChildScrollView(
                child: Container(
                    child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: <Widget>[
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(120, 95, 27, .3),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 5)
                                  )],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(22,22,22,12),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child : Column(
                                            children: <Widget>[
                                              Image.asset("assets/images/electrical.jpg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("About Electrical Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                      SizedBox(height: 10.0,),
                                      Text("Electrical wiring needs expertise attention to every building projects. It directly related to the safety of human beings and utilities / equipment people handle. The scope of electrical wiring shall cover supply, installation, testing and commissioning of all conduits and accessories, wiring, switches, socket outlets, spur outlets, junction boxes / pull boxes, GI pull wires, ceiling roses making connections etc. Unless otherwise indicated wiring shall consist of PVC insulated, copper conductor wires installed in heavy gauge steel galvanized conduits.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 20,),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(120, 95, 27, .3),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 5)
                                  )],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(22,22,22,12),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child : Column(
                                            children: <Widget>[
                                              Image.asset("assets/images/electrical_1.jpg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("Installing", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                      SizedBox(height: 10.0,),
                                      Text("Not sure what your office cabling needs are? No problem! Our team of technicians and engineers, are on hand to help and advise you on the best solutions to increase efficiency and cost-effectiveness.\n - Installation and repair services for fans, switches, wiring, and grounding\n - Background verified and experienced electricians in budget, at your service\n - Final price to be quoted on inspection of scope of work",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 20,),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(120, 95, 27, .3),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 5)
                                  )],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(22,22,22,12),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child : Column(
                                            children: <Widget>[
                                              Image.asset("assets/images/electrical_2.jpg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("Repair", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                      SizedBox(height: 10.0,),
                                      Text("Be sure not to work with energized wires or circuits.Identify the circuit and shut it off, then tag the circuit to keep it off.Before testing, make sure to cap your wires with wire nuts or insulate them with electrical tape when you need to turn the circuit back on. Identify the Hot wire coming in with Red or Black electrical tape so you can identify this wire from all the others. This is what I call \"flagging the hot wire\"",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                                    ],
                                  ),
                                )
                            ),
                            SizedBox(height: 20,),
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                      color: Color.fromRGBO(120, 95, 27, .3),
                                      blurRadius: 20.0,
                                      offset: Offset(0, 5)
                                  )],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(22,22,22,12),
                                  child: Column(
                                    children: <Widget>[
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Container(
                                          child : Column(
                                            children: <Widget>[
                                              Image.asset("assets/images/electrical_3.jpg"),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.0,),
                                      Text("Diagnose", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                      SizedBox(height: 10.0,),
                                      Text("What cable goes where.Check all devices served by each cable. Disconnect any devices that may be onnected to any associated cable. Check these devices to see if they are malfunctioning. Isolate or remove any ice in order to eliminate a failing component.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                                    ],
                                  ),
                                )
                            ),
                          ],
                        )
                    )
                ),
              )
          )
        )
    );
  }
}
