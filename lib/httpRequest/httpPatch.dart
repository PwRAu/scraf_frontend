import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/gradesCalc/gnerateGradesList.dart';
import 'package:home/gradesCalc/sortMark.dart';
import 'package:home/gradesCalc/splitMounths.dart';
import 'package:home/httpRequest/httpGetId.dart';
import 'package:home/httpRequest/httpGetSubjects.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/webApp/index.dart';
import 'package:http/http.dart' as http;

httpPatchCvInfo(BuildContext context) async {
  String urlPatch = "http://87.250.73.28:10780/students/$studentID";

  //print()

  String json = '{"cvv_username":"' +
      usernameCV.text +
      '","cvv_password":"' +
      pwdCV.text +
      '"}';

  await http.patch(urlPatch, body: json).then(
    (value) async {
      await httpGetId().then(
        (value) async {
          await httpGetSubj(context).then(
            (value) async {
              await generateGradesList().then((value) {
                sortMarks();
                splitMounths();
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
              });
            },
          );
        },
      );
    },
  );
}
