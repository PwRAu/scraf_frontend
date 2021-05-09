import 'dart:convert';
import 'package:home/global/config.dart';
import 'package:http/http.dart' as http;

httpGetId() async {
  String urlGetStudent =
      "https://scraf.pappacoda.it/api/students?mail=${email.text}";

  await client.get(urlGetStudent).timeout(Duration(minutes: 1)).then((value) {
    Map responseIdDec = jsonDecode(value.body);
    studentID = responseIdDec["id"];
  }).timeout(Duration(minutes: 1));
}
