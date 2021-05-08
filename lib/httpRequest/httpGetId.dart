import 'dart:convert';
import 'package:home/global/config.dart';
import 'package:http/http.dart' as http;

httpGetId() async {
  String urlGetStudent =
      "http://87.250.73.28:10780/students?mail=${email.text}";

  http.Response responseId = await http.get(urlGetStudent);

  Map responseIdDec = jsonDecode(responseId.body);
  studentID = responseIdDec["id"];
}
