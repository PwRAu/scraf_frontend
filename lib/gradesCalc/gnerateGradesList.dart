import 'package:flutter/cupertino.dart';
import 'package:home/global/config.dart';
import 'package:home/httpRequest/httpGetMarks.dart';

Future<void> generateGradesList() async {
  BuildContext context;
  grades.clear();
  subMarks.clear();
  for (int i = 0; i < subjectsId.length; i++) grades.add([]);
  for (int i = 0; i < subjectsId.length; i++) {
    //print(grades);
    //print(subjectsId[i]);
    await httpGetMarks(context, subjectsId[i]).then((value) => {
          for (int j = 0; j < subMarks.length; j++)
            {
              grades[i].add(subMarks[j].vote),
            }
        });
    //print(subjects[i]);
    //print(subjectsId[i]);
    //print(grades[i]);
    //print(i),
    subMarks.clear();

    //sleep(Duration(milliseconds: 200));
  }
}
