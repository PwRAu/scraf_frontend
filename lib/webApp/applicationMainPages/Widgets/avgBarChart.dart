import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/gradesCalc/getAvgForSubject.dart';

// ignore: must_be_immutable
class AvgBarChart extends StatelessWidget {
  double menuSize;
  AvgBarChart({this.menuSize});

  BarChartGroupData makeGroupData(int x, double y, Color col, int i) {
    return BarChartGroupData(
      x: x + 1,
      barRods: [
        BarChartRodData(
          y: num.parse(getAvgForSubject(grades[i]).toStringAsFixed(1)),
          width: 8,
          colors: [col],
          /*rodStackItems: [
            BarChartRodStackItem(0, 3, Colors.red),
            BarChartRodStackItem(3, 6, Colors.green),
            BarChartRodStackItem(6, 9, Colors.blue),
          ],*/
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(6),
            topRight: Radius.circular(6),
          ),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 10,
            colors: [Colors.grey[350]],
          ),
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    List<BarChartGroupData> myListOfData = [];
    /*
    for (int i = 0; i < subjects.length - 1; i++) {
      var r = new Random();
      double n = r.nextDouble() * 9 + 1;
      n = num.parse(n.toStringAsFixed(1));
      //print(subjects.length);
      //print(grades.length);
      myListOfData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: num.parse(getAvgForSubject(grades[i]).toStringAsFixed(1)),
              width: 8,
              //colors: [Color(0xff5afac4)],
              rodStackItems: [
                BarChartRodStackItem(0, 3, Colors.red),
                BarChartRodStackItem(3, 6, Colors.green),
                BarChartRodStackItem(6, 9, Colors.blue),
              ],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                y: 10,
                colors: [Colors.grey[350]],
              ),
            ),
          ],
        ),
      );
    }*/
    double _width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              "La tua media:",
              style: TextStyle(fontSize: 21),
            ),
            Container(
              height: 500,
              width: (_width - menuSize) * 0.45,
              child: Center(
                child: Container(
                  width: (_width - menuSize) * 0.40,
                  height: 435,
                  child: BarChart(
                    BarChartData(
                      maxY: 10,
                      minY: 1,
                      barGroups: List.generate(
                        subjectsId.length - 1,
                        (i) {
                          Color col;
                          num.parse(getAvgForSubject(grades[i])
                                      .toStringAsFixed(1)) >=
                                  6
                              ? col = Colors.green
                              : num.parse(getAvgForSubject(grades[i])
                                          .toStringAsFixed(1)) >=
                                      5
                                  ? col = Colors.orangeAccent
                                  : col = Colors.red;
                          return makeGroupData(
                              i,
                              num.parse(getAvgForSubject(grades[i])
                                  .toStringAsFixed(1)),
                              col,
                              i);
                        },
                      ),
                      barTouchData: BarTouchData(
                        allowTouchBarBackDraw: false,
                        touchTooltipData: BarTouchTooltipData(
                          getTooltipItem: (group, groupIndex, rod, rodIndex) {
                            return BarTooltipItem(
                                subjects[groupIndex] + ": ${rod.y}",
                                TextStyle(fontSize: 14, color: Colors.black));
                          },
                        ),
                      ),
                      axisTitleData: FlAxisTitleData(
                        show: true,
                        bottomTitle: AxisTitle(
                          titleText: "Le tue materie",
                          showTitle: true,
                        ),
                        leftTitle: AxisTitle(
                          titleText: "La tua media",
                          showTitle: true,
                          //textStyle: TextStyle(fontSize: 19),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: false,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      top: 625,
      left: (_width - menuSize) * (1 / 50),
    );
  }
}
