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
    double _height = MediaQuery.of(context).size.height;
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
              minX: 0,
              maxX: 30,
              minY: 1,
              maxY: 10,
              //backgroundColor: Color(0xff4dd0e1),
              lineBarsData: [
                LineChartBarData(
                  spots: [
                    FlSpot(0, 4),
                    FlSpot(3, 3),
                    FlSpot(7, 2),
                    FlSpot(13, 6),
                    FlSpot(18, 5),
                    FlSpot(21, 3),
                    FlSpot(24, 8),
                    FlSpot(27, 4),
                    FlSpot(30, 10),
                  ],
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
                  tooltipBgColor: Colors.blueAccent[200],
                  showOnTopOfTheChartBoxArea: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
