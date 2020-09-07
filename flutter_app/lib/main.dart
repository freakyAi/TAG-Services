import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'DrawerScreen.dart';
import 'TicketHistory.dart';
import 'bootloader.dart';
import 'getintouch.dart';
import 'invoke.dart';
import 'services.dart';
import 'storedData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team Acts Group Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Team Acts Group Services',pageController: 0,),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title,this.pageController}) : super(key: key);

  final String title;
  int pageController;

  @override
  _MyHomePageState createState() => _MyHomePageState(this.pageController);
}

class _MyHomePageState extends State<MyHomePage> {
  int pageController;
  _MyHomePageState(this.pageController);

  @override initState() {
    storedData dat = storedData();
    dat.setInt('userid', 2).then((value) {
      print('Userid saved');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child : pageController == 0 ? new Stack(
          children: [
            BootLoad()
          ],
        ) : pageController == 1 ? new Stack(
          children: [
            DrawerScreen(),
            HomeScreen(),
          ],
        ) : pageController == 2 ? new Stack(
          children: [
            DrawerScreen(),
            InvokeTicket(),
          ],
        ) : pageController == 3 ? new Stack(
          children: [
            DrawerScreen(),
            TicketHistory(),
          ],
        ) : pageController == 4 ? new Stack(
          children: [
            DrawerScreen(),
            Services(),
          ],
        ) : pageController == 5 ? new Stack(
          children: [
            DrawerScreen(),
            GetInTouch(),
          ],
      ) : new Stack(
          children: [
            BootLoad()
          ],
        )
      )
    );
  }
}
