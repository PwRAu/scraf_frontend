import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/gradesCalc/getAvgForSubject.dart';

// ignore: must_be_immutable
class AvgMarkCard extends StatelessWidget {
  double menuSize;

  AvgMarkCard({this.menuSize});

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    List<double> allM = [];
    for (int i = 0; i < grades.length; i++) {
      for (int j = 0; j < grades[i].length; j++) {
        allM.add(grades[i][j]);
      }
    }

    double tot = num.parse(getAvgForSubject(allM).toStringAsFixed(1));

    //print(tot);
    // List<double> avgEachSubj = [avg(mathMarks), avg(engMarks), avg(gpoMarks)];
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
                tween: Tween<double>(begin: 1, end: tot * 10),
                builder: (BuildContext context, double _tween, Widget child) {
                  return Container(
                    margin: EdgeInsets.only(top: 15),
                    height: 190,
                    width: (_width - menuSize) * 0.25,
                    child: PieChart(
                      PieChartData(
                        centerSpaceRadius: 75,
                        sections: [
                          tot.toInt() >= 6
                              ? new PieChartSectionData(
                                  value: (_tween).toDouble(),
                                  color: Colors.green,
                                  radius: 20,
                                  showTitle: true,
                                  title: "$tot",
                                  titlePositionPercentageOffset: -3.75,
                                  titleStyle: TextStyle(
                                    fontSize: 32,
                                    color: currentTheme.currentTheme() ==
                                            ThemeMode.light
                                        ? new Color(0xff000000)
                                        : new Color(0xffffffff),
                                  ))
                              : tot.toInt() >= 5
                                  ? new PieChartSectionData(
                                      value: (_tween).toDouble(),
                                      color: Colors.orange,
                                      radius: 20,
                                      showTitle: true,
                                      title: "$tot",
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
                                      title: "$tot",
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
