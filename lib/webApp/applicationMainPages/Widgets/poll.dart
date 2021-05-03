import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';

// ignore: must_be_immutable
class PollPreview extends StatelessWidget {
  double menuSize;
  PollPreview({this.menuSize});
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
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
                  "Sondaggio: Si?",
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
                    sections: [
                      new PieChartSectionData(
                          value: (35).toDouble(),
                          color: Colors.indigoAccent,
                          radius: 95,
                          showTitle: true,
                          title: "SI",
                          titleStyle: TextStyle(
                            fontSize: 16,
                            color:
                                currentTheme.currentTheme() == ThemeMode.light
                                    ? new Color(0xffffffff)
                                    : new Color(0xffffffff),
                          )),
                      PieChartSectionData(
                          value: (65).toDouble(),
                          color: Colors.blue,
                          radius: 95,
                          showTitle: true,
                          title: "SI, ma in blu",
                          titleStyle: TextStyle(
                              fontSize: 16,
                              color:
                                  currentTheme.currentTheme() == ThemeMode.light
                                      ? new Color(0xffffffff)
                                      : new Color(0xffffffff))),
                    ],
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
          2 * (_width - menuSize) * 0.25 +
          2 * (_width - menuSize) * (1 / 16),
    );
  }
}
