import 'package:flutter/material.dart';

class CCTV extends StatefulWidget {
  @override
  _CCTVState createState() => _CCTVState();
}

class _CCTVState extends State<CCTV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("CCTV Services"),
      ),
      body: SingleChildScrollView(
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
                                Image.asset("assets/images/cctv.jpg"),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0,),
                        Text("About CCTV Services", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                        SizedBox(height: 10.0,),
                        Text("A close-circuit television (CCTV) system, including cameras, monitors, digital video recorders (DVRs), and network video recorders (NVRs) can be a powerful deterrent of property crime, allowing you to provide surveillance and protection for your business.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                  Image.asset("assets/images/cctv_2.jpg"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Text("Getting the CCTV System for You", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                          SizedBox(height: 10.0,),
                          Text("Team Arts Group determining the right CCTV setup for your business depends on several factors including size and architecture of your property, the workflow of your employees, and the features you are looking to have. Working with you, we determine the right surveillance system to suit your needs perfectly.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                                  Image.asset("assets/images/cctv_3.jpg"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0,),
                          Text("We Offer The Best Quality Surveillance Systems", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                          SizedBox(height: 10.0,),
                          Text("We understand that keeping your business functioning smooth and safe is of the utmost importance – that is why we offer CCTV systems from the best in the industry.\n\n\t\t\tOur systems offer you a variety of features to enhance the surveillance and monitoring of any facility. The technological capabilities of our security cameras include:Analog and IP camera solutions,High definition resolution ,Motion-activated light and sound deterrence,Night vision technology,Infrared detection Off-site monitoring and control,Quality Installation and Service.",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
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
                          Text("Quality Installation and Service", style: TextStyle(color: Colors.blueGrey, fontSize: 20.0, fontFamily: "Arial"),),
                          SizedBox(height: 10.0,),
                          Text("You deserve to hav a CCTV system installed by knowledgeable and experienced professionals. We strive to be the best in the industry, and guarantee your satisfaction.\n\nWe have all your surveillance system needs covered: \n- Professional system installation \n- System configuration and training\n- Maintenance and repairs\n- Free telephone & tech support\n- 24/7 emergency service",style: TextStyle(fontSize: 16), textAlign: TextAlign.justify,)
                        ],
                      ),
                    )
                ),
              ],
            )
          )
        ),
      )
    );
  }
}
