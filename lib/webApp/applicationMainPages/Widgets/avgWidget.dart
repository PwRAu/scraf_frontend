import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';

// ignore: must_be_immutable
class AvgMarkCard extends StatelessWidget {
  double menuSize;

  AvgMarkCard({this.menuSize});
  double avg(List<double> marks) {
    return (sumOfVotes(marks) / marks.length);
  }

  double sumOfVotes(List<double> subj) {
    double sum = 0;
    for (int i = 0; i < subj.length; i++) {
      sum += subj[i];
    }
    return sum;
  }

  double sumOfAvg(List<double> subj) {
    double sum = 0;
    for (int i = 0; i < subj.length; i++) {
      sum += subj[i];
    }
    return sum;
  }

  double calcPerncetage(List<double> subj, List<double> allAvg) {
    double avgSubj = avg(subj);
    return (avgSubj * 100) / sumOfVotes(allAvg);
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<double> mathMarks = [50, 70, 80, 55, 80, 20];
    List<double> engMarks = [55, 75, 90, 15, 80, 30];
    List<double> gpoMarks = [22, 35, 90, 85, 40, 100];

    List<double> allMarks = mathMarks + engMarks + gpoMarks;
    List<double> avgEachSubj = [avg(mathMarks), avg(engMarks), avg(gpoMarks)];
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
                  "La tua media",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TweenAnimationBuilder(
                duration: Duration(milliseconds: 750),
                tween: Tween<double>(begin: 1, end: avg(allMarks)),
                builder: (BuildContext context, double _tween, Widget child) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 190,
                    width: (_width - menuSize) * 0.25,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 75,
                        sections: [
                          avg(allMarks).toInt() >= 60
                              ? new PieChartSectionData(
                                  value: (_tween).toDouble(),
                                  color: Colors.green,
                                  radius: 20,
                                  showTitle: true,
                                  title: "${avg(allMarks).toInt()}",
                                  titlePositionPercentageOffset: -3.75,
                                  titleStyle: TextStyle(
                                    fontSize: 32,
                                    color: currentTheme.currentTheme() ==
                                            ThemeMode.light
                                        ? new Color(0xff000000)
                                        : new Color(0xffffffff),
                                  ))
                              : avg(allMarks).toInt() >= 50
                                  ? new PieChartSectionData(
                                      value: (_tween).toDouble(),
                                      color: Colors.orange,
                                      radius: 20,
                                      showTitle: true,
                                      title: "${avg(allMarks).toInt()}",
                                      titlePositionPercentageOffset: -3.75,
                                      titleStyle: TextStyle(
                                        fontSize: 32,
                                        color: currentTheme.currentTheme() ==
                                                ThemeMode.light
                                            ? new Color(0xff000000)
                                            : new Color(0xffffffff),
                                      ),
                                    )
                                  : new PieChartSectionData(
                                      value: (_tween).toDouble(),
                                      color: Colors.red,
                                      radius: 20,
                                      showTitle: true,
                                      title: "${avg(allMarks).toInt()}",
                                      titlePositionPercentageOffset: -3.75,
                                      titleStyle: TextStyle(
                                        fontSize: 32,
                                        color: currentTheme.currentTheme() ==
                                                ThemeMode.light
                                            ? new Color(0xff000000)
                                            : new Color(0xffffffff),
                                      )),
                          PieChartSectionData(
                              value: (100 - _tween).toDouble(),
                              color: Colors.grey[300],
                              radius: 20,
                              showTitle: false),
                        ],
                        startDegreeOffset: 270,
                        borderData: FlBorderData(show: false),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      top: 325,
      left: (_width - menuSize) * (1 / 16),
    );
  }
}
