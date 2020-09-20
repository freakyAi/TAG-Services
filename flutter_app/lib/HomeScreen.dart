import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:fluttericon/linearicons_free_icons.dart';
import 'package:fluttericon/rpg_awesome_icons.dart';

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
import 'ImageCarousel.dart';

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
  
List<String> _selectService = [
  "CCTV\nServices",
  "Air\nConditioner",
  "House\nKeeping",
  "Electrical\nServices",
  "Plumbing\nServices",
  "IT\nServices",
  "Vending\nMachines",
  "Paper Shredding\nMachines"
];

List _navigate = [
  CCTV(),
  AC(),
  HouseKeeping(),
  Electrical(),
  Plumbing(),
  IT(),
  Vending(),
  Paper(),
];

List _icons = [
  Icons.videocam,
  Icons.ac_unit,
  FontAwesome5.quidditch,
  Icons.lightbulb_outline,
  FontAwesome5.tools,
  LineariconsFree.laptop_phone,
  LineariconsFree.coffee_cup,
  Icons.content_cut
];

List<Map<String,dynamic>> _buildGrid= new List();


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
      for(int i=0;i<_icons.length;i++){
        _buildGrid.add({
          "icon":_icons[i],
          "name":_selectService[i],
          "navigate":_navigate[i]
        });
      }
  }

// Widget _buildIconTray() {
//   return ListView.builder(
//     itemCount: 3,
//     shrinkWrap: true,
//     itemBuilder: (BuildContext context, index)=>Container(
//       width: MediaQuery.of(context).size.width,
//       padding: EdgeInsets.symmetric(horizontal: 10,),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: (){
//                     print("Index : $index");
//                     Navigator.push(context, new MaterialPageRoute(
//                         builder: (BuildContext context) => _navigate[index*3])
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
//                     //height: MediaQuery.of(context).size.height/6,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       //borderRadius: BorderRadius.circular(10),
// //                      boxShadow: [BoxShadow(
// // //                          color: Color.fromRGBO(120, 95, 27, .3),
// // //                          blurRadius: 20.0,
// // //                          offset: Offset(0, 5)
// //                     )],
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(_icons[index],color: Colors.blue,size: 40,),
//                         SizedBox(height: 20,),
//                         Text(
//                           _selectService[index*3],
//                           style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               //SizedBox(width: 20,),
//               Expanded(
//                 child: InkWell(
//                   onTap: (){
//                     print("Index : $index");
//                     Navigator.push(context, new MaterialPageRoute(
//                         builder: (BuildContext context) => _navigate[index*3+1])
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                     //height: MediaQuery.of(context).size.height/6,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     //   borderRadius: BorderRadius.circular(10),
//                     //  boxShadow: [BoxShadow(
//                     //     //  color: Color.fromRGBO(120, 95, 27, .3),
//                     //     //  blurRadius: 20.0,
//                     //     //  offset: Offset(0, 5)
//                     //  )],
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(_icons[index],color: Colors.blue,size: 40,),
//                         SizedBox(height: 20,),
//                         Text(
//                           _selectService[(index*3)+1],
//                           style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: index < 2 ? InkWell(
//                   onTap: (){
//                     print("Index : $index");
//                     Navigator.push(context, new MaterialPageRoute(
//                         builder: (BuildContext context) => _navigate[index*3+2])
//                     );
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
//                     //height: MediaQuery.of(context).size.height/6,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                     //   borderRadius: BorderRadius.circular(10),
//                     //  boxShadow: [BoxShadow(
//                     //     //  color: Color.fromRGBO(120, 95, 27, .3),
//                     //     //  blurRadius: 20.0,
//                     //     //  offset: Offset(0, 5)
//                     //  )],
//                     ),
//                     child: Column(
//                       children: [
//                         Icon(_icons[index],color: Colors.blue,size: 40,),
//                         SizedBox(height: 20,),
//                         Text(
//                           _selectService[(index*3)+2],
//                           style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
//                         )
//                       ],
//                     ),
//                   ),
//                 ) : Container()
//               ),
//             ],
//           ),
//           //SizedBox(height: 20,)
//         ],
//       ),
//     ),
//   );
// }

Widget _buildIcons(){
  return Container(
    height: 500,
    padding: EdgeInsets.symmetric(horizontal:20,vertical: 20),
    child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.0,
        padding: const EdgeInsets.all(4.0),
        mainAxisSpacing: 3.0,
        crossAxisSpacing: 3.0,
        children: _buildGrid.map((var entry) {
          return GridTile(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey[200]
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(entry["icon"],color: Colors.blue,size: 40,),
                    SizedBox(height:10),
                    Text(
                           entry["name"],
                            style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),textAlign: TextAlign.center,
                          )
                  ],
                ),
              ));
        }).toList()),
  );
}


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
            color: Colors.grey[50],
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
                SizedBox(height: 30,),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    boxShadow: [BoxShadow(
                         color: Colors.grey,
                         blurRadius: 2.0,
                   )],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  margin: EdgeInsets.fromLTRB(20,0,20,0),
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
                      SizedBox(height:20),
                      ImageCarousel(),
                      SizedBox(height: 5,),
                      _buildIcons(),
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