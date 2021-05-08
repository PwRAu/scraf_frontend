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
      "http://87.250.73.28:10780/students/$studentIDtoStr/subjects/$subjId/marks";

  http.Response responseMarks = await http.get(urlAPIMarks);

  Map responseSubMarks = jsonDecode(responseMarks.body);

  List<dynamic> pppp = responseSubMarks["grades"];

  for (int i = 0; i < pppp.length; i++) {
    var s = pppp[i]["decimalValue"];

    subMarks.add(
      Marks(
        description: pppp[i]["notesForFamily"],
        vote: s.toDouble(),
      ),
    );
  }
  return 1;
}
