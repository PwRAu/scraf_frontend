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
                          colors: [Color(0xffadd8e6)],
                          dotData: FlDotData(show: true),
                          belowBarData: BarAreaData(
                            show: true,
                            colors: [Color(0xff0277bd)]
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
            children = Center(
              child: SizedBox(
                child: CircularProgressIndicator(),
                width: 60,
                height: 60,
              ),
            );
          }
          return children;
        });
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
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: (_width * 0.75) * 0.80,
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
