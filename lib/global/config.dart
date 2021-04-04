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
var client = http.Client();
