import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/loginPage/registryreg.dart';
import 'package:http/http.dart' as http;

httpRegScraf(BuildContext context) async {
  // set up POST request arguments

  String url = 'https://scraf.pappacoda.it/api/students';
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

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Material(
        child: RegisterRegistration(),
      ),
    ),
  );
}
