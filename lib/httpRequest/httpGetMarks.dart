import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
import 'package:http/http.dart' as http;

Future<int> httpGetMarks(BuildContext context, int subid) async {
  String studentIDtoStr = studentID.toString();
  String subjId = subid.toString();
  subMarks.clear();
  //subMarks.clear();

  String urlAPIMarks =
      "https://scraf.pappacoda.it/api/students/$studentIDtoStr/subjects/$subjId/marks";

  await client.get(urlAPIMarks).timeout(Duration(minutes: 1)).then((value) {
    Map responseSubMarks = jsonDecode(value.body);

    List<dynamic> pppp = responseSubMarks["grades"];

    for (int i = 0; i < pppp.length; i++) {
      var s = pppp[i]["decimalValue"];

      subMarks.add(
        Marks(
          description: pppp[i]["notesForFamily"],
          vote: s.toDouble(),
          date: pppp[i]["evtDate"],
        ),
      );
    }
    return 1;
  }).timeout(Duration(minutes: 1));
}
