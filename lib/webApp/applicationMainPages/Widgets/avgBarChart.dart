import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';

// ignore: must_be_immutable
class AvgBarChart extends StatelessWidget {
  double menuSize;
  AvgBarChart({this.menuSize});

  Widget build(BuildContext context) {
    List<BarChartGroupData> myListOfData = [];

    for (int i = 0; i < subjects.length; i++) {
      var r = new Random();
      double n = r.nextDouble() * 9 + 1;
      n = num.parse(n.toStringAsFixed(1));
      myListOfData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: n,
              width: 8,
              colors: [Color(0xff19bfff)],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ],
        ),
      );
    }
    double _width = MediaQuery.of(context).size.width;
    return Positioned(
      child: Card(
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: Text(
                "La tua media:",
                style: TextStyle(fontSize: 21),
              ),
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
                      minY: 0,
                      barGroups: myListOfData,
                      barTouchData: BarTouchData(
                        allowTouchBarBackDraw: false,
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
      left: (_width - menuSize) * (1 / 16),
    );
  }
}
