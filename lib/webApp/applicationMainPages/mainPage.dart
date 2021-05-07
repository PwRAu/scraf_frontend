import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
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
  /*
  void initState() {
    super.initState();
    sizeOfMainPage.addListener(() {
      setState(() {});
    });
  }*/

  @override
  Widget build(BuildContext context) {
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
          //AvgMarkCard(
          //menuSize: _menuSize,
          //),
          /*
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
          ),*/
        ],
      ),
    );
  }
}

/*
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
*/
