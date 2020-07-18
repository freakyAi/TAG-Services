import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';

import 'login.dart';
import 'main.dart';

class BootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TAG Services',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.grey[50],
        dividerColor: Colors.blue[100],
        //secondaryHeaderColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BootLoad(),
    );
  }
}


class BootLoad extends StatefulWidget {
  @override
  _BootLoadState createState() => _BootLoadState();
}

class _BootLoadState extends State<BootLoad> {

  @override
  void initState(){
    super.initState();
    _checkForSession();
  }

  // ignore: missing_return
  Future<bool> _checkForSession() async {
    await Future.delayed(Duration(milliseconds: 2000),() {});
    _read();
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => MyHomePage(pageController: 1,)
      )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginPage()
        )
    );
  }

  _read() async{
    final prefs = await SharedPreferences.getInstance();
    final key = 'loginToken';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
    if(value == 'true'){
      print('Home page loading..');
      _navigateToHome();
    }
    else{
      print('Login page loading..');
      _navigateToLogin();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
          Shimmer.fromColors(
            baseColor: Colors.black38,
            highlightColor: Colors.black26,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                "Team Arts Group\n     Services",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Agne-Regular',
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                    ),
                  ],
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}
