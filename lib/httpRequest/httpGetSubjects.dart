import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:http/http.dart' as http;

Future<void> httpGetSubj(BuildContext context) async {
  String urlApiSubj =
      "https://scraf.pappacoda.it/api/students/$studentID/subjects";

  await client.get(urlApiSubj).timeout(Duration(minutes: 1)).then((value) {
    Map responseSubDec = jsonDecode(value.body);

    List<dynamic> pppp = responseSubDec["subjects"];
    for (int i = 0; i < pppp.length - 1; i++) {
      subjects.add(pppp[i]["description"]);
      subjectsId.add(pppp[i]["id"]);
    }
  }).timeout(Duration(minutes: 1));

  //decodifica risposta per ottenere solo il token

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
