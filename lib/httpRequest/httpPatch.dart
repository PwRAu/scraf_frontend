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
  String urlPatch = "https://scraf.pappacoda.it/api/students/$studentID";

  //print()

  String json = '{"cvv_username":"' +
      usernameCV.text +
      '","cvv_password":"' +
      pwdCV.text +
      '"}';
  subjects.clear();
  subjectsId.clear();
  subMarks.clear();
  avgForEachSub.clear();
  grades.clear();
  dateM.clear();
  descriptionM.clear();
  sortedGrades.clear();
  sortedDateM.clear();
  sortedDescriptionM.clear();
  gradeForMounth.clear();
  mounthDone = 0;
  await client.patch(urlPatch, body: json).timeout(Duration(minutes: 1)).then(
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
  ).timeout(Duration(minutes: 1));
}
