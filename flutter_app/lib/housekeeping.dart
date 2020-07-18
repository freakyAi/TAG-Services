import 'package:flutter/material.dart';

import 'getintouch.dart';

class HouseKeeping extends StatefulWidget {
  @override
  _HouseKeepingState createState() => _HouseKeepingState();
}

class _HouseKeepingState extends State<HouseKeeping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("House Keeping"),
        ),
        body: Container(
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
                                          Image.asset("assets/images/housekeeping.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("About Housekeeping Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("We are mainly offering Daily cleaning & Deep cleaning Services.\nOur primary focused is to keep clean your house and office. To ensure your safety and healthy life. Regular cleaning service is regularly restored to order and easily maintained, its remove regular dust. Our priority is to help you live easy and comfort. So that organize your house to clean and it’s protect you to safe life and its give a confidence to the children for studies, playing etc.\nWhen it comes to workplace housekeeping, the term incorporates much more than simply cleaning, dusting, and mopping. Workplace housekeeping encompasses offices, factories, warehouses, and other manufacturing and distribution facilities.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/housekeeping_2.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Keep the Light Fixtures Clean", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Good lighting is essential for commercial facilities. Therefore, the light fixtures ought to be cleaned regularly so that the accumulated dust doesn’t affect the quality of light intensity in the room. Improper lighting has an impact on the performance of the workforce and also makes the place appear dingy.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/housekeeping_3.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Floor and Building Maintenance", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Effective housekeeping involves floor and surface maintenance. The walls and the floors ought to be cleaned with perfection. If there are any oil, grease, or liquid spillages, then these must be cleaned immediately to prevent hazards from occurring. Warning signs must be placed if there are any spillages to make people aware. The walls should be painted in light color and the floors should be skid resistant. The plumbing, electrical, and other utility systems should work efficiently. The doors and windows of the building must be stable.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                  Text("Upkeep the Tools and Equipment", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("One of the basic elements of good housekeeping is to check that the tools and equipment are functional. Inspection of tools should be done periodically in order to detect faulty equipment. Well-maintained tools and machinery prevent accidents from happening. Tools and equipment mist also be stored properly and should also have appropriate labels.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                                ],
                              ),
                            )
                        ),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) => new GetInTouch() )
                            );
                          },
                          child :Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    colors: [
                                      Colors.blue[800],
                                      Colors.blue[500],
                                      Colors.blue[300]
                                    ]
                                )
                            ),
                            child: Center(
                              child: Text("Contact Us / Get In Touch", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        SizedBox(height: 30,)
                      ],
                    )
                )
            ),
          )
        )
    );
  }
}
