import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/loginPage/homepage.dart';
import 'package:home/loginPage/registryreg.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/webApp/index.dart';
import 'package:http/http.dart' as http;

httpGetId() async {
  String urlGetStudent =
      "http://87.250.73.28:10780/students?mail=${email.text}";

  http.Response responseId = await http.get(urlGetStudent);

  Map responseIdDec = jsonDecode(responseId.body);
  studentID = responseIdDec["id"];
  //print(studentID);
}

Future<void> httpGetSubj(BuildContext context) async {
  //String studentIDtoStr = studentID.toString();
  //print("$studentID");
  String urlApiSubj = "http://87.250.73.28:10780/students/$studentID/subjects";
  //print(urlApiSubj);
  //URL richiesta per ottenere token
  //String urlCVForToken = "https://web.spaggiari.eu/rest/v1/auth/login";

  //Header richieste Token
  /*
  Map<String, String> headersCVRequestForToken = {
    "Content-Type": "application/json",
    "User-Agent": "zorro/1.0",
    "Z-Dev-ApiKey": "+zorro+",
  };
  */

  //Json per richiesta Token
  /*
  String jsonForToken = '{"uid":"$cvUser","pass":"$cvPwd"}';
  http.Response response = await http.post(
    urlCVForToken,
    headers: headersCVRequestForToken,
    body: jsonForToken,
  );
  */
  //print(response);
  //print(response.body);

  //decodifica risposta per ottenere solo il token
  //Map respondeDecoded = jsonDecode(response.body);
  //print(respondeDecoded["token"]);
  //String userToken = respondeDecoded["token"];

  //URL richiesta per ottenere materie
  //String urlCVForSubject =
  //"https://web.spaggiari.eu/rest/v1/students/5861340/subjects?ffilter=subjects(id,description)";

  //Header richiesta materie
  /*
  Map<String, String> headersCVRequestForSubject = {
    "Content-Type": "application/json",
    "User-Agent": "zorro/1.0",
    "Z-Dev-ApiKey": "+zorro+",
    "Z-Auth-token": "$userToken",
  };
  */
  //print(headersCVRequestForSubject);
  /*
  http.Response responseSubject =
      await http.get(urlCVForSubject, headers: headersCVRequestForSubject);
      */
  //print(responseSubject.body);

  http.Response responseSubject = await http.get(urlApiSubj);

  //decodifica risposta per ottenere solo il token
  Map responseSubDec = jsonDecode(responseSubject.body);
  //Map so = jsonDecode(responseSubDec["subject"]);

  List<dynamic> pppp = responseSubDec["subjects"];
  for (int i = 0; i < pppp.length; i++) {
    subjects.add(pppp[i]["description"]);
    subjectsId.add(pppp[i]["id"]);
  }

  //httpGetMarks(context, subjectsId[0]);

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Index(
        buildWho: MainPage(),
        menuState: MenuOpen(menuWidth: 224, menuOpen: true),
      ),
    ),
  );
}

httpGetMarks(BuildContext context, int subid) async {
  String studentIDtoStr = studentID.toString();
  String subjId = subid.toString();

  //subMarks.clear();

  String urlAPIMarks =
      "http://87.250.73.28:10780/students/$studentIDtoStr/subjects/$subjId/marks";

  http.Response responseMarks = await http.get(urlAPIMarks);

  Map responseSubMarks = jsonDecode(responseMarks.body);
  //Map so = jsonDecode(responseSubDec["subject"]);

  List<dynamic> pppp = responseSubMarks["grades"];

  for (int i = 0; i < pppp.length; i++) {
    //subjects.add(pppp[i]["description"]);
    //marksValue.add(pppp[i]["decimalValue"]);
    //marksDesc.add(pppp[i]["notesForFamily"]);
    var s = pppp[i]["decimalValue"];

    subMarks.add(
      Marks(
        description: pppp[i]["notesForFamily"],
        vote: s.toDouble(),
      ),
    );
    //print(subMarks[i]);
  }
}

httpRegScraf(BuildContext context) async {
  // set up POST request arguments

  String url = 'http://87.250.73.28:10780/students';
  Map<String, String> headers = {"Content-Type": " application/json"};
  String json = '{"mail":"' +
      email.text +
      '","password":"' +
      password.text +
      '","name":"' +
      username.text +
      '","surname":"gioia"}';

  http.Response response = await http.post(url, headers: headers, body: json);
  Map responseSubDec = jsonDecode(response.body);
  int statusCode = response.statusCode;
  studentID = responseSubDec["id"];
  //print(studentID);
  //print(statusCode);

  /*
  API NOSTRA
  */
  //String urlApiSubj = "http://87.250.73.28:10780/students/1/subjects";

  //URL richiesta per ottenere token
  //String urlCVForToken = "https://web.spaggiari.eu/rest/v1/auth/login";

  //Header richieste Token
  /*
  Map<String, String> headersCVRequestForToken = {
    "Content-Type": "application/json",
    "User-Agent": "zorro/1.0",
    "Z-Dev-ApiKey": "+zorro+",
  };
  */

  //Json per richiesta Token
  /*
  String jsonForToken = '{"uid":"$cvUser","pass":"$cvPwd"}';
  http.Response response = await http.post(
    urlCVForToken,
    headers: headersCVRequestForToken,
    body: jsonForToken,
  );
  */
  //print(response);
  //print(response.body);

  //decodifica risposta per ottenere solo il token
  //Map respondeDecoded = jsonDecode(response.body);
  //print(respondeDecoded["token"]);
  //String userToken = respondeDecoded["token"];

  //URL richiesta per ottenere materie
  //String urlCVForSubject =
  //"https://web.spaggiari.eu/rest/v1/students/5861340/subjects?ffilter=subjects(id,description)";

  //Header richiesta materie
  /*
  Map<String, String> headersCVRequestForSubject = {
    "Content-Type": "application/json",
    "User-Agent": "zorro/1.0",
    "Z-Dev-ApiKey": "+zorro+",
    "Z-Auth-token": "$userToken",
  };
  */
  //print(headersCVRequestForSubject);
  /*
  http.Response responseSubject =
      await http.get(urlCVForSubject, headers: headersCVRequestForSubject);
      */
  //print(responseSubject.body);
  /*
  http.Response responseSubject = await http.get(urlApiSubj);

  //decodifica risposta per ottenere solo il token
  Map responseSubDec = jsonDecode(responseSubject.body);
  //Map so = jsonDecode(responseSubDec["subject"]);

  List<dynamic> pppp = responseSubDec["subjects"];
  for (int i = 0; i < pppp.length; i++) {
    subjects.add(pppp[i]["description"]);
    subjectsId.add(pppp[i]["id"]);
  }

  String urlAPIMarks =
      "http://87.250.73.28:10780/students/1/subjects/213780/marks";

  http.Response responseMarks = await http.get(urlAPIMarks);

  Map responseSubMarks = jsonDecode(responseMarks.body);

  print(responseSubMarks);
  print("lol");
  print(subjectsId);

  //print(subjects);

  //print(responseSubDec);
  //print(responseSubDec.length);
  //for (int i = 0; i < 20; i++) {
  // print(responseSubDec["subjects"][i]["description"]);
  //}
  //print(responseSubDec["subjects"][0]["description"]);
  //print(email.text);
  /*
  if (statusCode == 202) {
    return true;
  } else {
    return false;
  }*/
  /*
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Index(
        buildWho: MainPage(),
        menuState: MenuOpen(menuWidth: 224, menuOpen: true),
      ),
    ),
  );*/
  */
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Material(
        child: RegisterRegistration(),
      ),
    ),
  );
}

httpPatchCvInfo(BuildContext context) async {
  String urlPatch = "http://87.250.73.28:10780/students/$studentID";

  //print()

  String json = '{"cvv_username":"' +
      usernameCV.text +
      '","cvv_password":"' +
      pwdCV.text +
      '"}';

  http.Response response = await http.patch(urlPatch, body: json);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Index(
        buildWho: MainPage(),
        menuState: MenuOpen(
          menuWidth: 224,
          menuOpen: true,
        ),
      ),
    ),
  );
}
