import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/webApp/index.dart';
import 'package:http/http.dart' as http;

Future<void> httpGetSubj(BuildContext context) async {
  String urlApiSubj = "http://87.250.73.28:10780/students/$studentID/subjects";

  http.Response responseSubject = await http.get(urlApiSubj);

  //decodifica risposta per ottenere solo il token
  Map responseSubDec = jsonDecode(responseSubject.body);

  List<dynamic> pppp = responseSubDec["subjects"];
  for (int i = 0; i < pppp.length - 1; i++) {
    subjects.add(pppp[i]["description"]);
    subjectsId.add(pppp[i]["id"]);
  }
  /*
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Index(
        buildWho: MainPage(),
        menuState: MenuOpen(menuWidth: 224, menuOpen: true),
      ),
    ),
  );
  */
}
