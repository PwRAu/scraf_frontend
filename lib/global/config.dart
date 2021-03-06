library config.globals;

import 'package:flutter/material.dart';
import 'theme.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;

MyTheme currentTheme = MyTheme();
Box box;
final myController = TextEditingController();
var client = http.Client();
