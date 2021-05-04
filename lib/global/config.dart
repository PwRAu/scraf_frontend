library config.globals;

import 'package:flutter/material.dart';
import '../webApp/applicationMainPages/mainPage.dart';
import 'theme.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

MyTheme currentTheme = MyTheme();
Box box;
Widget builder = MainPage();
final username = TextEditingController();
final email = TextEditingController();
final password = TextEditingController();
String cvUser = "S5861340Z";
String cvPwd = "ga30456n";
var client = http.Client();
List<String> subjects = [];
List<Color> colorsForSubj = [
  Colors.amber,
  Colors.blueAccent,
  Colors.cyan,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.green,
  Colors.indigo,
  Colors.lime,
  Colors.orange,
  Colors.pink
];
