import 'package:home/global/config.dart';

void sortMarks() {
  for (int i = 0; i < grades.length; i++) {
    for (int j = 0; j < grades[i].length; j++) {
      sortedDateM.add(dateM[i][j]);
      sortedGrades.add(grades[i][j]);
      sortedDescriptionM.add(descriptionM[i][j]);
    }
  }

  for (int i = 0; i < sortedGrades.length - 1; ++i) {
    for (int j = 0; j < sortedGrades.length - i - 1; ++j) {
      if (sortedDateM[j].compareTo(sortedDateM[j + 1]) > 0) {
        String tmpS = sortedDateM[j];
        double tmpI = sortedGrades[j];
        String tmpD = sortedDescriptionM[j];

        sortedGrades[j] = sortedGrades[j + 1];
        sortedDateM[j] = sortedDateM[j + 1];
        sortedDescriptionM[j] = sortedDescriptionM[j + 1];
        sortedDescriptionM[j + 1] = tmpD;
        sortedDateM[j + 1] = tmpS;
        sortedGrades[j + 1] = tmpI;
      }
    }
  }
  //print(sortedDateM);
}
