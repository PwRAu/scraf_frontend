import 'dart:io';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/global/config.dart';
import 'package:home/httpRequest/httpGetMarks.dart';
import 'package:home/httpRequest/httpRequest.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';

// ignore: must_be_immutable
class SubjcetPage extends StatelessWidget {
  String name;
  MenuState stateM;
  int index;
  SubjcetPage({this.name, this.stateM, this.index});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    List<FlSpot> spotsList = [];
    subMarks.clear();
    //print(index);

    //sleep(Duration(seconds: 1));
    /*
    for (int i = 1; i < 12; i++) {
      var r = new Random();
      double n = r.nextDouble() * 9 + 1;
      n = num.parse(n.toStringAsFixed(1));
      subMarks.add(Marks(
          vote: n, description: "questo è quel cazzo di voto che hai preso"));
      spotsList.add(FlSpot(i.toDouble(), n));
    }
    */

    //print(subMarks.length);
    return FutureBuilder(
        future: httpGetMarks(context, subjectsId[index]),
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          Widget children;
          const cutOffYValue = 10.0;
          const cutOffYValue2 = 6.0;
          if (snapshot.hasData) {
            for (int i = 1; i <= subMarks.length; i++) {
              spotsList.add(
                FlSpot(i.toDouble(), subMarks[i - 1].vote),
              );
            }
            children = Column(
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
                  width: _width - stateM.menuWidth - 100,
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
                          colors: [Color(0xffff4e12)],
                          dotData: FlDotData(show: true),
                          preventCurveOverShooting: true,
                          /*aboveBarData: BarAreaData(
                            show: true,
                            colors: [Colors.redAccent.withOpacity(0.4)],
                            cutOffY: cutOffYValue,
                            applyCutOffY: true,
                          ),*/
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [Color(0xffff4e12).withOpacity(0.1)],
                            cutOffY: cutOffYValue2,
                          ),
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
                          tooltipBgColor: Colors.white,
                          showOnTopOfTheChartBoxArea: false,
                          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                            return touchedBarSpots.map(
                              (barSpot) {
                                final flSpot = barSpot;
                                return LineTooltipItem(
                                  "Prova del ${subMarks[flSpot.x.toInt() - 1].date} : ${subMarks[flSpot.x.toInt() - 1].vote}",
                                  TextStyle(fontSize: 14, color: Colors.black),
                                );
                              },
                            ).toList();
                          },
                        ),
                      ),
                      titlesData: FlTitlesData(
                        bottomTitles: SideTitles(
                          getTitles: (value) {
                            return subMarks[value.toInt() - 1].date;
                          },
                          getTextStyles: (value) => TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                          showTitles: true,
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
                      width: (_width - stateM.menuWidth) - 150,
                      height: 700,
                      child: MarksList(
                        listOfMarsk: subMarks,
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            children = Column(
              children: [
                SizedBox(
                  height: _height / 2.1,
                ),
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
              ],
            );
          }
          return children;
        });
  }
}

class Marks {
  Marks({this.vote, this.description, this.date});
  double vote;
  String description;
  String date;
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
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: (_width * 0.75) * 0.65,
                      height: 75,
                      child: SingleChildScrollView(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, top: 5),
                          child: Text(
                            listOfMarsk[i].description,
                            style: TextStyle(fontSize: 17),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: (_width * 0.75) * 0.70,
                    child: Container(
                      width: 120,
                      height: 75,
                      child: Container(
                        margin: EdgeInsets.only(left: 10, top: 5),
                        child: Text(
                          "data: " + listOfMarsk[i].date,
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    child: Container(
                      width: 50,
                      height: 75,
                      child: Center(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: listOfMarsk[i].vote >= 6
                                ? Colors.green
                                : Colors.red,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              listOfMarsk[i].vote.toString(),
                              style: TextStyle(
                                fontSize: 19,
                                color: Colors.white70,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
