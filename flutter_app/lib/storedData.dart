

import 'package:shared_preferences/shared_preferences.dart';

class storedData {
  SharedPreferences prefs;

//  @override
//  initState() {
//  }

  Future<int> getInt(String str) async {
      prefs = await SharedPreferences.getInstance();
      int temp = prefs.getInt(str) ?? -1;
      return temp;
  }

  Future<String> getString(String str) async {
    prefs = await SharedPreferences.getInstance();
    String temp = prefs.getString(str) ?? '';
    return temp;
  }

  Future<void> setInt(String str, int value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setInt(str, value);
  }

  Future<void> setString(String str, String value) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(str, value);
  }
}