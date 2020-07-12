import 'package:flutter/material.dart';

class IT extends StatefulWidget {
  @override
  _ITState createState() => _ITState();
}

class _ITState extends State<IT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("IT Services"),
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
                                          Image.asset("assets/images/it.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("About IT Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Are you looking for an it support & service companies in India? The TAG services organization has the experience and expertise to help your business meet your goals and objectives faster, with less risk. TAG Sevices is a consulting organization who assists customers in achieving their business objectives with the use of technology.\nWhether you are looking at Cloud, Virtualization, other IT services, or just want to better understand your current environment, Team Arts Group can provide the expertise to help you build a strategy that is right for you.\nHaving excellent command over technology and a zest to continuously upgrade, we deliver end-to-end ongoing IT support and managed it services while planning strategies, design and development, testing and deployment. Throughout the entire process, we focus on scalability, and problem-solving methodologies, ensuring the output to be excellent in terms of quality and usability.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/it_2.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("IT Consulting", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("Our consultants are knowledgeable and reliable enough to provide IT consulting at any level of your IT project. It doesn’t matter on which stage of your software or mobile application development project you might have stuck up, we are here with a problem-solving approach to help you with your project completion successfully.", style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                          Image.asset("assets/images/it_3.jpg"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.0,),
                                  Text("Our aim to deliver 24/7 uninterrupted IT Support and Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                                  SizedBox(height: 10.0,),
                                  Text("We very well understand the significance of stress-free IT environment and thus have been trusted to provide managed it services from more than a decade.We can empower businesses with all comprehensive, focused & flexible managed IT services",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
    );
  }
}
