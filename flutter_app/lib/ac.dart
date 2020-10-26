import 'package:flutter/material.dart';
import 'package:tagservices/main.dart';
import 'getintouch.dart';

class AC extends StatefulWidget {
  @override
  _ACState createState() => _ACState();
}

class _ACState extends State<AC> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: new AppBar(
        //   title: new Text("Air Conditioner"),
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
                        Text("Air Conditioner", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),)
                      ],
                    ),
                    Column()
                  ],
                ),
              ),
              SizedBox(height: 20),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Color(0xFFC6C6C6),
                                blurRadius: 2.0,
                                offset: Offset(0, 2)
                            )]
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
                                          Image.asset("assets/images/ac_2.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Duct cleaning & Installation", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Your home’s or business’s ductwork carries millions of seen and unseen contaminants and particles through the air every day. Because your system becomes dirtier with time and use, air duct cleaning is a fundamental service for improving and maintaining your indoor air quality.Team Arts Group experts understand the importance and the mechanics of thorough and routine air duct cleaning services. Put our local technicians to work on maintaining your home or business air ducts, today!\n\n\t\t\tWith increasing globalization and drastic change in the weather conditions, AC's have become an essential part of our lives today. But with AC's come the extra care one needs to take care of the AC service now and then.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/ac_3.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Indoor Air Quality", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("As per the latest research, it has been concluded the indoor air is far more polluted than the outdoor air. Also, we tend to spend 80% of our time indoors in the Air conditioned rooms; it becomes essential to maintain the indoor quality of air in places such as schools, hospitals, colleges, offices, etc. For the same reason, people tend to contact the service centre, AC’s are extremely important to be taken care of regularly.\n\n\t\t\tLike anything, one needs to be regular with the air conditional cleaning service as well. The three main essential elements of AC's are fins, filters, and coils that require regularly clean up. Such servicing of AC is required.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/ac.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Commercial AC Maintenance", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("AC Cleaning Services for Filters:\n\nFilters add up to the overall efficiency of the AC. The dirty filters contribute to blocking the airflow. As a result, the air that travels through these dirty filters tends to carry a lot of dirt which is transferred to the coil and affects the capacity of the coil to absorb heat. Hence regular AC service of the filters can reduce the energy consumption of the AC.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
