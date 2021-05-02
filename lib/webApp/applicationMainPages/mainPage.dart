import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';

import '../../global/config.dart';

class MainPage extends StatefulWidget {
  final MenuState state;
  MainPage({this.state});
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  /*
  void initState() {
    super.initState();
    sizeOfMainPage.addListener(() {
      setState(() {});
    });
  }*/

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

  @override
  Widget build(BuildContext context) {
    double _menuSize;
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
    widget.state is MenuOpen ? _menuSize = 224 : _menuSize = 96;
    //print(_menuSize);
    //
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
    return Container(
      width: _width,
      height: _height * 2,
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: _width,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _width - _menuSize - 50,
                      height: 300,
                      decoration: BoxDecoration(
                          //color: Colors.blue
                          ),
                      child: LineChart(
                        LineChartData(
                          minX: 1,
                          maxX: 30,
                          minY: 1,
                          maxY: 10,
                          //backgroundColor: Color(0xff4dd0e1),
                          lineBarsData: [
                            LineChartBarData(
                              spots: [
                                FlSpot(1, 3),
                                FlSpot(3, 2),
                                FlSpot(7, 7),
                                FlSpot(13, 4),
                                FlSpot(18, 9),
                                FlSpot(21, 7),
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
                              handleBuiltInTouches: true,
                              touchTooltipData: LineTouchTooltipData(
                                tooltipBgColor: Colors.grey[500],
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
                width: (_width - _menuSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - _menuSize) * 0.25,
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
                      tween: Tween<double>(begin: 0, end: avg(allMarks)),
                      builder:
                          (BuildContext context, double _tween, Widget child) {
                        return Container(
                          margin: EdgeInsets.only(top: 15),
                          height: 190,
                          width: (_width - _menuSize) * 0.25,
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
            left: (_width - _menuSize) * (1 / 16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width: (_width - _menuSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - _menuSize) * 0.25,
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
                      width: (_width - _menuSize) * 0.25,
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
            left: (_width - _menuSize) * (1 / 16) +
                (_width - _menuSize) * 0.25 +
                (_width - _menuSize) * (1 / 16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width: (_width - _menuSize) * 0.25,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 2),
                      width: (_width - _menuSize) * 0.25,
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
                      width: (_width - _menuSize) * 0.25,
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
            left: (_width - _menuSize) * (1 / 16) +
                2 * (_width - _menuSize) * 0.25 +
                2 * (_width - _menuSize) * (1 / 16),
          ),
          Positioned(
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
                    width: (_width - _menuSize) * 0.45,
                    child: Center(
                      child: Container(
                        width: (_width - _menuSize) * 0.40,
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
            left: 100,
          ),
        ],
      ),
    );
  }
}

class BarData {
  //static List<Data> barData = [];

  void sos() {
    for (int i = 0; i < subjects.length; i++) {
      barData.add(
        Data(color: Color(0xff19bfff), id: i, name: subjects[i], y: 3),
      );
    }
  }

  static List<Data> barData = [
    Data(
      id: 0,
      name: 'Mon',
      y: 5,
      color: Color(0xff19bfff),
    ),
    Data(
      name: 'Tue',
      id: 1,
      y: 2,
      color: Color(0xffff4d94),
    ),
    Data(
      name: 'Wed',
      id: 2,
      y: 9,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Thu',
      id: 3,
      y: 10,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Fri',
      id: 4,
      y: 5,
      color: Color(0xff2bdb90),
    ),
    Data(
      name: 'Sat',
      id: 5,
      y: 7,
      color: Color(0xffffdd80),
    ),
    Data(
      name: 'Sun',
      id: 6,
      y: 9,
      color: Color(0xffff4d94),
    ),
  ];
}

class Data {
  // for ordering in the graph
  final int id;
  final String name;
  final double y;
  final Color color;

  const Data({
    @required this.name,
    @required this.id,
    @required this.y,
    @required this.color,
  });
}