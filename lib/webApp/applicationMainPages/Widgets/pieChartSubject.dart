import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/gradesCalc/getAvgForSubject.dart';

// ignore: must_be_immutable
class PieChartSubjects extends StatelessWidget {
  double menuSize;
  PieChartSubjects({this.menuSize});
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<double> mathMarks = [50, 70, 80, 55, 80, 20];
    List<double> engMarks = [55, 75, 90, 15, 80, 30];
    List<double> gpoMarks = [22, 35, 90, 85, 40, 100];

    double sumOfVotes(List<double> subj) {
      double sum = 0;
      for (int i = 0; i < subj.length; i++) {
        sum += subj[i];
      }
      return sum;
    }

    double r1 = 95;

    double calcPerncetage(double subj) {
      double avgSubj = subj;
      return (avgSubj * 100) / sumOfVotes(avgForEachSub);
    }

    //List<double> avgEachSubj = [avg(mathMarks), avg(engMarks), avg(gpoMarks)];
    avgForEachSub.clear();
    for (int i = 0; i < subjects.length - 1; i++) {
      avgForEachSub
          .add(num.parse(getAvgForSubject(grades[i]).toStringAsFixed(1)));
    }
    //print(avgForEachSub);
    return Positioned(
      child: Card(
        child: Container(
          height: 250,
          width: (_width - menuSize) * 0.25,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 2),
                width: (_width - menuSize) * 0.25,
                height: 30,
                child: Text(
                  "Peso materie",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                height: 190,
                width: (_width - menuSize) * 0.25,
                child: PieChart(
                  PieChartData(
                    centerSpaceRadius: 0,
                    sections: List.generate(
                      subjects.length - 1,
                      (i) {
                        //print(avgForEachSub[i]);
                        return PieChartSectionData(
                          value: (calcPerncetage(avgForEachSub[i])),
                          color: colorsForSubj[i],
                          radius: r1,
                          showTitle: true,
                          title: (i + 1).toString(),
                          titleStyle: TextStyle(
                            fontSize: 16,
                            color:
                                currentTheme.currentTheme() == ThemeMode.light
                                    ? new Color(0xffffffff)
                                    : new Color(0xffffffff),
                          ),
                        );
                      },
                    ),
                    startDegreeOffset: 270,
                    borderData: FlBorderData(show: false),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      top: 325,
      left: (_width - menuSize) * (1 / 16) +
          (_width - menuSize) * 0.25 +
          (_width - menuSize) * (1 / 16),
    );
  }
}
/*
[
                      PieChartSectionData(
                        value:
                            (calcPerncetage(mathMarks, avgEachSubj)).toDouble(),
                        color: Colors.deepOrangeAccent,
                        radius: r1,
                        showTitle: true,
                        title: "Mate",
                        titleStyle: TextStyle(
                          fontSize: 16,
                          color: currentTheme.currentTheme() == ThemeMode.light
                              ? new Color(0xffffffff)
                              : new Color(0xffffffff),
                        ),
                      ),
                      PieChartSectionData(
                          value: (calcPerncetage(engMarks, avgEachSubj))
                              .toDouble(),
                          color: Colors.purple,
                          radius: r2,
                          showTitle: true,
                          title: "Ing",
                          titleStyle: TextStyle(
                              fontSize: 16,
                              color:
                                  currentTheme.currentTheme() == ThemeMode.light
                                      ? new Color(0xffffffff)
                                      : new Color(0xffffffff))),
                      PieChartSectionData(
                          value: (calcPerncetage(gpoMarks, avgEachSubj))
                              .toDouble(),
                          color: Colors.brown,
                          radius: r3,
                          showTitle: true,
                          title: "GPO",
                          titleStyle: TextStyle(
                            fontSize: 16,
                            color:
                                currentTheme.currentTheme() == ThemeMode.light
                                    ? new Color(0xffffffff)
                                    : new Color(0xffffffff),
                          )),
                    ],
                    */
