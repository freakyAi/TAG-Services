import 'package:flutter/material.dart';

//Import Pages
import 'Electrical.dart';
import 'Paper.dart';
import 'Plumbing.dart';
import 'Vending.dart';
import 'ac.dart';
import 'cctv.dart';
import 'housekeeping.dart';
import 'it.dart';

class Services extends StatefulWidget {
  @override
  _ServicesState createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

  List _selectIcon = [
    "assets/images/cctv.jpg",
    "assets/images/ac.jpg",
    "assets/images/housekeeping.jpg",
    "assets/images/electrical.jpg",
    "assets/images/plumbing.jpg",
    "assets/images/it.jpg",
    "assets/images/vending.jpg",
    "assets/images/paper.jpg"
  ];

  List _selectService = [
    "CCTV Services",
    "Air Conditioner",
    "House Keeping",
    "Electrical Services",
    "Plumbing Services",
    "IT Services",
    "Vending Machines",
    "Paper Shredding Machines"
  ];

  List _navigate = [
    CCTV(),
    AC(),
    HouseKeeping(),
    Electrical(),
    Plumbing(),
    IT(),
    Vending(),
    Paper()
  ];
  
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)..scale(scaleFactor),
      duration: Duration(milliseconds: 250),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(isDrawerOpen?20:0)
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(isDrawerOpen?20:0),
          ),
          child: InkWell(
            onTap: () {
              setState(() {
                xOffset = 0;
                yOffset = 0;
                scaleFactor = 1;
                isDrawerOpen = false;
              });
            },
            child: Column(
              children: [
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.fromLTRB(20,0,50,0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      isDrawerOpen ? IconButton(
                          icon: Icon(Icons.arrow_back_ios), onPressed: (){
                        setState(() {
                          xOffset = 0;
                          yOffset = 0;
                          scaleFactor = 1;
                          isDrawerOpen = false;
                        });
                      }
                      ): IconButton(icon: Icon(Icons.menu), onPressed: (){
                        setState(() {
                          xOffset = 230;
                          yOffset = 150;
                          scaleFactor = 0.6;
                          isDrawerOpen = true;
                        });
                      }),
                      //SizedBox(width: 50,),
                      Column(
                        children: [
                          Text("Services", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemCount: 8,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index)=>Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(horizontal: 10,),
                            child: InkWell(
                                onTap: (){
                                  print("Index : $index");
                                  Navigator.push(context, new MaterialPageRoute(
                                      builder: (BuildContext context) => _navigate[index])
                                  );
                                },
                                child:  Padding(
                                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                                  child: Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                    child: Container(
                                      //width: double.infinity,
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
                                          child: Padding(
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
                                                      Container(
                                                          width: 50,
                                                          height:50,
                                                          child: CircleAvatar(
                                                            backgroundImage: AssetImage(_selectIcon[index]),
                                                          )
                                                      ),
                                                      SizedBox(width: 40,),
                                                      Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: <Widget>[
                                                          Text(
                                                            _selectService[index],
                                                            style: TextStyle(color: Colors.black, fontSize: 18,fontWeight: FontWeight.bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ))
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

