import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:home/gradesCalc/getAvgForSubject.dart';
import 'package:home/webApp/applicationMainPages/Widgets/avgBarChart.dart';
import 'package:home/webApp/applicationMainPages/Widgets/avgWidget.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';

import '../../global/config.dart';
import 'Widgets/lastMark.dart';
import 'Widgets/pieChartSubject.dart';
import 'Widgets/poll.dart';

class MainPage extends StatefulWidget {
  final MenuState state;
  MainPage({this.state});
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    List<String> mounth = [
      "Settembre",
      "Ottobre",
      "Novembre",
      "Dicembre",
      "Gennaio",
      "Febbraio",
      "Marzo",
      "Aprile",
      "Maggio",
      "Giugno"
    ];
    double _menuSize;
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //double pSize = 224;
    //int avgMark = 82;

    //print(calcPerncetage(mathMarks, avgEachSubj));
    widget.state is MenuOpen ? _menuSize = 224 : _menuSize = 96;
    //print(_menuSize);
    //
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
                          maxX: mounthDone.toDouble(),
                          minY: 1,
                          maxY: 10,
                          //backgroundColor: Color(0xff4dd0e1),
                          lineBarsData: [
                            LineChartBarData(
                              spots: makeSpots(),
                              isCurved: true,
                              curveSmoothness: 0.5,
                              colors: [Color(0xf0ffffff)],
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color(0xffffffff)]
                                    .map((e) => e.withOpacity(0.2))
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
                              getTooltipItems:
                                  (List<LineBarSpot> touchedBarSpots) {
                                return touchedBarSpots.map(
                                  (barSpot) {
                                    final flSpot = barSpot;
                                    return LineTooltipItem(
                                      "${mounth[flSpot.x.toInt() - 1]}: ${flSpot.y}",
                                      TextStyle(fontSize: 15),
                                    );
                                  },
                                ).toList();
                              },
                            ),
                          ),
                          titlesData: FlTitlesData(
                            bottomTitles: SideTitles(
                              getTitles: (value) {
                                return mounth[value.toInt() - 1];
                              },
                              getTextStyles: (value) => TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              showTitles: true,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          AvgMarkCard(
            menuSize: _menuSize,
          ),
          PieChartSubjects(
            menuSize: _menuSize,
          ),
          PollPreview(
            menuSize: _menuSize,
          ),
          AvgBarChart(
            menuSize: _menuSize,
          ),
          LastMarks(
            menuSize: _menuSize,
          ),
        ],
      ),
    );
  }
}

List<FlSpot> makeSpots() {
  //print(gradeForMounth[7]);
  List<FlSpot> list = [];
  for (int i = 1; i <= mounthDone; i++) {
    if (gradeForMounth[i - 1].isNotEmpty) {
      list.add(
        FlSpot(
          i.toDouble(),
          num.parse(
            getAvgForSubject(gradeForMounth[i - 1]).toStringAsFixed(1),
          ),
        ),
      );
    } else {
      list.add(FlSpot.nullSpot);
    }
  }
  return list;
}
/*[
                                FlSpot(
                                  1,
                                  num.parse(
                                    getAvgForSubject(gradeForMounth[1])
                                        .toStringAsFixed(1),
                                  ),
                                ),
                                FlSpot(3, 2),
                                FlSpot(7, 7),
                                FlSpot(13, 4),
                                FlSpot(18, 9),
                                FlSpot(21, 7),
                                FlSpot(24, 3),
                                FlSpot(27, 2),
                                FlSpot(30, 4),
                              ]*/
