import 'package:flutter/material.dart';
import 'package:tagservices/Drawer.dart';

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Services"),
      ),
      drawer: DrawerMenu(),
      body:
      ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, index)=>Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: InkWell(
            onTap: (){
              print("Index : $index");
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => _navigate[index])
              );
            },
            child:  Padding(
              padding: const EdgeInsets.all(4.0),
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
                            Colors.orange[800],
                            Colors.orange[400],
                            Colors.orange[400]
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
                                    width: 60,
                                    height:60,
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
                                      style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
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
    )
    );
  }
}

