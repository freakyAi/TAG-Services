import 'package:flutter/cupertino.dart';
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
import 'ImageSlider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

List _selectService = [
  "CCTV Services",
  "Air Conditioner",
  "House Keeping",
  "Electrical Services",
  "Plumbing Services",
  "IT Services",
  "Vending Machines",
  "Paper Shreddig\nMachines"
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

Widget _buildIconTray() {
  return ListView.builder(
    itemCount: 4,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, index)=>Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 30,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(
                  onTap: (){
                    print("Index : $index");
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => _navigate[index*2])
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    height: MediaQuery.of(context).size.height/6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(10),
//                      boxShadow: [BoxShadow(
////                          color: Color.fromRGBO(120, 95, 27, .3),
////                          blurRadius: 20.0,
////                          offset: Offset(0, 5)
////                      )],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.ac_unit,color: Colors.blue,size: 40,),
                        SizedBox(height: 20,),
                        Text(
                          _selectService[index*2],
                          style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20,),
              Expanded(
                child: InkWell(
                  onTap: (){
                    print("Index : $index");
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => _navigate[index*2+1])
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    height: MediaQuery.of(context).size.height/6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(10),
//                      boxShadow: [BoxShadow(
//                          color: Color.fromRGBO(120, 95, 27, .3),
//                          blurRadius: 20.0,
//                          offset: Offset(0, 5)
//                      )],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.ac_unit,color: Colors.blue,size: 40,),
                        SizedBox(height: 20,),
                        Text(
                          _selectService[(index*2)+1],
                          style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    ),
  );
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;

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
                          Text("TAG Services", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                        ],
                      ),
                      Column(),
                    ],
                  ),
                ),
                //SizedBox(height:10),
                Container(
                  //padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      ImageSlider(),
                      SizedBox(height: 5,),
                      Container(
                          height: MediaQuery.of(context).size.height/1.55,
                          child: _buildIconTray()
                      ),
                    ],
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