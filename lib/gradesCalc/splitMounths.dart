import 'package:home/global/config.dart';

void splitMounths() {
  var year = DateTime.now();
  for (int i = 0; i < 12; i++) {
    gradeForMounth.add([]);
  }
  for (int i = 0; i < sortedGrades.length; i++) {
    if (sortedDateM[i].compareTo("${(year.year) - 1}-09-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year) - 1}-10-01") < 0) {
      gradeForMounth[0].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year) - 1}-10-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year) - 1}-11-01") < 0) {
      gradeForMounth[1].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year) - 1}-11-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year) - 1}-12-01") < 0) {
      gradeForMounth[2].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year) - 1}-12-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-01-01") < 0) {
      gradeForMounth[3].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-01-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-02-01") < 0) {
      gradeForMounth[4].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-02-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-03-01") < 0) {
      gradeForMounth[5].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-03-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-04-01") < 0) {
      gradeForMounth[6].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-04-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-05-01") < 0) {
      gradeForMounth[7].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-05-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-06-01") < 0) {
      gradeForMounth[8].add(sortedGrades[i]);
    }
    if (sortedDateM[i].compareTo("${(year.year)}-06-01") >= 0 &&
        sortedDateM[i].compareTo("${(year.year)}-07-01") < 0) {
      gradeForMounth[8].add(sortedGrades[i]);
    }
  }
  int i = 1;
  bool check = true;
  while (i < 12 && check) {
    if (gradeForMounth[i].isEmpty)
      check = false;
    else
      i++;
  }
  mounthDone = i;
  //print(gradeForMounth[1]);
}
