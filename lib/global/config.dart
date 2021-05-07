library config.globals;

import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
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
final usernameCV = TextEditingController();
final pwdCV = TextEditingController();
int studentID;
String cvUser;
String cvPwd;
var client = http.Client();
List<String> subjects = [];
List<int> subjectsId = [];
List<Marks> subMarks = [];

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
  Colors.orange,
  Colors.pink
];
