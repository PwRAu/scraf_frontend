import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../global/config.dart';

class MainPage extends StatefulWidget {
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  void initState() {
    super.initState();
    sizeOfMainPage.addListener(() {
      setState(() {});
    });
  }

  double r1 = 95, r2 = 95, r3 = 95;
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
    double _height = MediaQuery.of(context).size.height;
    //double pSize = 224;
    //int avgMark = 82;
    List<double> mathMarks = [50, 70, 80, 55, 80, 20];
    List<double> engMarks = [55, 75, 90, 15, 80, 30];
    List<double> gpoMarks = [22, 35, 90, 85, 40, 100];

    List<double> allMarks = mathMarks + engMarks + gpoMarks;
    List<double> avgEachSubj = [avg(mathMarks), avg(engMarks), avg(gpoMarks)];

    //print(calcPerncetage(mathMarks, avgEachSubj));
    //print(_width - sizeOfMainPage.pSize);
    return Container(
      width: _width - sizeOfMainPage.pSize,
      height: _height * 2,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: _width - sizeOfMainPage.pSize,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _width - sizeOfMainPage.pSize - 50,
                      height: 300,
                      decoration: BoxDecoration(
                          //color: Colors.blue
                          ),
                      child: LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 30,
                          minY: 0,
                          maxY: 6,
                          //backgroundColor: Color(0xff4dd0e1),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(3, 1),
                                FlSpot(7, 2),
                                FlSpot(13, 4),
                                FlSpot(18, 5),
                                FlSpot(21, 1),
                                FlSpot(24, 3),
                                FlSpot(27, 2),
                                FlSpot(30, 4),
                              ],
                              isCurved: true,
                              curveSmoothness: 0.5,
                              colors: [Color(0xffffffff)],
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color(0xffffffff)]
                                    .map((e) => e.withOpacity(0.3))
                                    .toList(),
                              ),
                              preventCurveOverShooting: true,
                            ),
                          ],
                          borderData: FlBorderData(
                            show: false,
                            border: Border.all(
                                color: const Color(0xff37434d), width: 2),
                          ),
                          lineTouchData: LineTouchData(
                              fullHeightTouchLine: false,
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.redAccent[200],
                                showOnTopOfTheChartBoxArea: false,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width: (_width - sizeOfMainPage.pSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - sizeOfMainPage.pSize) * 0.25,
                      height: 50,
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
                      tween: Tween<double>(begin: 0, end: avg(allMarks)),
                      builder:
                          (BuildContext context, double _tween, Widget child) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 150,
                          width: (_width - sizeOfMainPage.pSize) * 0.25,
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
                                            titlePositionPercentageOffset:
                                                -3.75,
                                            titleStyle: TextStyle(
                                              fontSize: 32,
                                              color:
                                                  currentTheme.currentTheme() ==
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
                                            titlePositionPercentageOffset:
                                                -3.75,
                                            titleStyle: TextStyle(
                                              fontSize: 32,
                                              color:
                                                  currentTheme.currentTheme() ==
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
            left: (_width - sizeOfMainPage.pSize) * (1 / 16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width: (_width - sizeOfMainPage.pSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - sizeOfMainPage.pSize) * 0.25,
                      height: 50,
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
                      height: 150,
                      width: (_width - sizeOfMainPage.pSize) * 0.25,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 0,
                          sections: [
                            PieChartSectionData(
                              value: (calcPerncetage(mathMarks, avgEachSubj))
                                  .toDouble(),
                              color: Colors.deepOrangeAccent,
                              radius: r1,
                              showTitle: true,
                              title: "Mate",
                              titleStyle: TextStyle(
                                fontSize: 16,
                                color: currentTheme.currentTheme() ==
                                        ThemeMode.light
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
                                    color: currentTheme.currentTheme() ==
                                            ThemeMode.light
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
                                  color: currentTheme.currentTheme() ==
                                          ThemeMode.light
                                      ? new Color(0xffffffff)
                                      : new Color(0xffffffff),
                                )),
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
            left: (_width - sizeOfMainPage.pSize) * (1 / 16) +
                (_width - sizeOfMainPage.pSize) * 0.25 +
                (_width - sizeOfMainPage.pSize) * (1 / 16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width: (_width - sizeOfMainPage.pSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - sizeOfMainPage.pSize) * 0.25,
                      height: 50,
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
                      height: 150,
                      width: (_width - sizeOfMainPage.pSize) * 0.25,
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
                                  color: currentTheme.currentTheme() ==
                                          ThemeMode.light
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
                                    color: currentTheme.currentTheme() ==
                                            ThemeMode.light
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
            left: (_width - sizeOfMainPage.pSize) * (1 / 16) +
                2 * (_width - sizeOfMainPage.pSize) * 0.25 +
                2 * (_width - sizeOfMainPage.pSize) * (1 / 16),
          ),
        ],
      ),
    );
  }
}
