import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ImageSlider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
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
                SizedBox(height:10),
                ImageSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
