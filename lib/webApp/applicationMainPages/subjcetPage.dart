import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';

// ignore: must_be_immutable
class SubjcetPage extends StatelessWidget {
  String name;
  MenuState stateM;
  SubjcetPage({this.name, this.stateM});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    List<Marks> subMarks = [];
    List<FlSpot> spotsList = [];
    for (int i = 1; i < 14; i++) {
      var r = new Random();
      double n = r.nextDouble() * 9 + 1;
      subMarks.add(Marks(
          vote: n, description: "questo è quel cazzo di voto che hai preso"));
      spotsList.add(FlSpot(i.toDouble(), n));
    }
    //print(_width - stateM.menuWidth);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _width,
          height: 100,
          child: Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
        Container(
          width: _width - stateM.menuWidth - 50,
          height: 300,
          decoration: BoxDecoration(//color: Colors.blue
              ),
          child: LineChart(
            LineChartData(
              minX: 1,
              maxX: subMarks.length.toDouble(),
              minY: 1,
              maxY: 10,
              //backgroundColor: Color(0xff4dd0e1),
              lineBarsData: [
                LineChartBarData(
                  spots: spotsList,
                  isCurved: true,
                  curveSmoothness: 0.5,
                  colors: [Color(0xffaab123)],
                  dotData: FlDotData(show: true),
                  belowBarData: BarAreaData(
                    show: true,
                    colors: [Color(0xff00ff00)]
                        .map((e) => e.withOpacity(0.3))
                        .toList(),
                  ),
                  preventCurveOverShooting: true,
                ),
              ],
              borderData: FlBorderData(
                show: false,
                border: Border.all(color: const Color(0xff37434d), width: 2),
              ),
              lineTouchData: LineTouchData(
                fullHeightTouchLine: false,
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipBgColor: Colors.blueAccent[100],
                  showOnTopOfTheChartBoxArea: false,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Text(
            "I tuoi voti:",
            style: TextStyle(fontSize: 30),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Scrollbar(
          controller: ScrollController(),
          thickness: 8,
          child: SingleChildScrollView(
            primary: false,
            child: Container(
              width: (_width - stateM.menuWidth) - 100,
              height: 700,
              child: MarksList(
                listOfMarsk: subMarks,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Marks {
  Marks({this.vote, this.description});
  double vote;
  String description;
}

class MarksList extends StatelessWidget {
  MarksList({this.listOfMarsk});
  final List<Marks> listOfMarsk;
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    return Container(
      child: ListView.builder(
          itemCount: listOfMarsk.length,
          itemBuilder: (context, i) {
            return Card(
              child: Container(
                width: _width * 0.75,
                height: 75,
                child: Row(
                  children: [
                    Container(
                      width: (_width * 0.75) * 0.90,
                      height: 75,
                      child: Center(
                        child: Text(
                          listOfMarsk[i].description,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                    Container(
                      width: (_width * 0.75) * 0.1,
                      height: 75,
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: listOfMarsk[i].vote > 6
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(listOfMarsk[i].vote.toInt().toString(),
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.white70,
                                )),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
