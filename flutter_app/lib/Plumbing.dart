import 'package:flutter/material.dart';

import 'getintouch.dart';

class Plumbing extends StatefulWidget {
  @override
  _PlumbingState createState() => _PlumbingState();
}

class _PlumbingState extends State<Plumbing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Plumbing Services"),
        // ),
        body: Container(
           decoration: BoxDecoration(
          color: Colors.blue[50],
        ),
          child: SingleChildScrollView(
            child: Container(
                child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.fromLTRB(20,0,50,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        // Navigator.push(context, new MaterialPageRoute(
                        //     builder: (BuildContext context) => new MyHomePage(pageController: 4,))
                        // );
                        Navigator.pop(context);
                      }
                    ),
                    //SizedBox(width: 50,),
                    Column(
                      children: [
                        Text("Plumbing Services", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column()
                  ],
                ),
              ),
              SizedBox(height:20),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Color(0xFFC6C6C6),
                                blurRadius: 2.0,
                                offset: Offset(0, 2)
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
                                          Image.asset("assets/images/plumbing.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("About Plumbing Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("When you have a plumbing issue that needs professional attention, look no further than TAG Services. No matter how skilled you might be at home maintenance, some jobs should only ever be tackled by a professional, and plumbing is one of them. When you book plumbers through the TAG Services, you'll be booking a cheap but reliable plumbing professional who will know just where to look to find the source of the problem and who will have all the right tools and expertise to fix it.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                color: Color(0xFFC6C6C6),
                                blurRadius: 2.0,
                                offset: Offset(0, 2)
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
                                          Image.asset("assets/images/plumbing_1.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Replacement of Old Plumbing Works", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("At some point in the future, you will need to replace your faucets, pipes, and some parts of the toilet.Not only will the replacement of old parts prevent major emergency plumbing repairs, but you will also save money and prevent structural damage to your home. Hidden leaks can eventually destroy the walls, floors, and ceiling of your home, an accident that you could have prevented by simply calling for the best plumbing services company in Pune.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                color: Color(0xFFC6C6C6),
                                blurRadius: 2.0,
                                offset: Offset(0, 2)
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
                                          Image.asset("assets/images/plumbing.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Pipe Leak Repair and Unclogging", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("If your pipes are hidden in the walls or under the floor, it can be difficult to detect leaks and rusting until you see stains and significant damage to the structure. If you happen to see such signs in your home here in Singapore, call a reliable worker to fix rusty pipes and toilet bowl leaks. A 24 hours plumber can take care of any of your piping concerns, including unclogging of your home’s water ways from food, debris, oil, hair and dirt.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                color: Color(0xFFC6C6C6),
                                blurRadius: 2.0,
                                offset: Offset(0, 2)
                            )],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(22,22,22,12),
                              child: Column(
                                children: <Widget>[
                                  Text("Plumbing Maintenance and Inspection", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Finally, you can rely on the best plumbing services company in Pune for your regular plumbing servicing. If you want to know what the plumber will do during a routine inspection, you can ask for a checklist that might include the following: \n*Leak check *Testing the shut-off valve at each fixture *Inspection of the joints and pipes that are visible *Check for corrosion *Check for strange noises in the *shower, tubs, and drains; drain-cleaning *Check the shower heads and faucet aerators *Inspect the caulking in the toilet base, sink, tub, and shower *Inspect the toilet *Check the water supply in the laundry room *Check the water pressure *Replace worn-out parts *Inspect the water heater and replace the anode rod if needed *Check the temperature of the water from the water heater.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
