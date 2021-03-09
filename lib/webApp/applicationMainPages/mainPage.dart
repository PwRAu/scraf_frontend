import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../global/config.dart';

class MainPage extends StatefulWidget{
  _MainPage createState()=> _MainPage();
}

class _MainPage extends State<MainPage>{
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height= MediaQuery.of(context).size.height;
    double k = 100;
    double pSize=224;
    int avgMark=82;

    return Container(
      height: _height*2,
      child:Stack(
        children:[
          Column(
            children: [
              Container(
                width: _width-pSize,
                height: 450,
                decoration: BoxDecoration(
                  color: Colors.grey[850],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: _width-pSize-50,
                      height: 400,
                      decoration: BoxDecoration(
                        //color: Colors.blue
                      ),
                      child:LineChart(
                        LineChartData(
                          minX: 0,
                          maxX: 30,
                          minY: 0,
                          maxY: 6,
                          //backgroundColor: Color(0xff4dd0e1),
                          lineBarsData: [
                            LineChartBarData(
                              spots:[
                                FlSpot(0,3),
                                FlSpot(3,1),
                                FlSpot(7,2),
                                FlSpot(13,4),
                                FlSpot(18,5),
                                FlSpot(21,1),
                                FlSpot(24,3),
                                FlSpot(27,2),
                                FlSpot(30,4),
                              ],
                              isCurved: true,
                              curveSmoothness: 0.5,
                              colors: [Color(0xffffffff)],
                              dotData: FlDotData(show: true),
                              belowBarData: BarAreaData(
                                show: true,
                                colors: [Color(0xffffffff)].map((e) => e.withOpacity(0.3)).toList(),
                              ),
                              preventCurveOverShooting: true,
                            ),
                          ],
                          borderData: FlBorderData(
                            show: false,
                            border: Border.all(color: const Color(0xff37434d),width: 2),
                          ),
                          lineTouchData: LineTouchData(
                            fullHeightTouchLine: false,
                            handleBuiltInTouches: true,
                            touchTooltipData: LineTouchTooltipData(
                              tooltipBgColor: Colors.redAccent[200],
                              showOnTopOfTheChartBoxArea: false,
                            )
                          ),
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
                width:(_width-pSize)*0.25,
                child: Column(
                  children:[
                    Container(
                      width: (_width-pSize)*0.25,
                      height: 50,
                      child: Text(
                        "La tua media",
                        style: TextStyle(fontSize: 29,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:15),
                      height: 150,
                      width:(_width-pSize)*0.25,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 75,
                          sections: [
                            avgMark>=60?
                            new PieChartSectionData(
                              value:(avgMark).toDouble(),color:Colors.green,radius: 15,showTitle: true,title: "${avgMark/10}",
                              titlePositionPercentageOffset: -5.0,titleStyle: TextStyle(fontSize: 32,color: currentTheme.currentTheme()==ThemeMode.light? new Color(0xff000000): new Color(0xffffffff),)
                            ):
                            avgMark>=50? new PieChartSectionData(
                              value:(avgMark).toDouble(),color:Colors.orange,radius: 15,showTitle: false,title: "${avgMark/10}",
                              titlePositionPercentageOffset: -5.0,titleStyle: TextStyle(fontSize: 32,color: Colors.black,),
                            ):
                            new PieChartSectionData(
                              value:(avgMark).toDouble(),color:Colors.red,radius: 15,showTitle: false,title: "${avgMark/10}",
                              titlePositionPercentageOffset: -5.0,titleStyle: TextStyle(fontSize: 32,color: Colors.black,)
                            ),
                            PieChartSectionData(value:(100-avgMark).toDouble(),color:Colors.white,radius: 15,showTitle: false),
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
            top: 430,
            left: (_width-pSize)*(1/16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width:(_width-pSize)*0.25,
                child: Column(
                  children:[
                    Container(
                      width: (_width-pSize)*0.25,
                      height: 50,
                      child: Text(
                        "Sondaggio: luca suca?",
                        style: TextStyle(fontSize: 29,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:15),
                      height: 150,
                      width:(_width-pSize)*0.25,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 0,
                          sections: [
                            new PieChartSectionData(
                              value:(35).toDouble(),color:Colors.indigoAccent,radius: 95,showTitle: true,title: "SI",titleStyle: TextStyle(fontSize: 16,color: currentTheme.currentTheme()==ThemeMode.light? new Color(0xffffffff): new Color(0xffffffff),)
                            ),
                            PieChartSectionData(value:(65).toDouble(),color:Colors.blue,radius: 95,showTitle: true,title:"SI, ma in blu",titleStyle: TextStyle(fontSize: 16,color: currentTheme.currentTheme()==ThemeMode.light? new Color(0xffffffff): new Color(0xffffffff))),
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
            top: 430,
            left: (_width-pSize)*(1/16)+(_width-pSize)*0.25+(_width-pSize)*(1/16),
          ),
          Positioned(
            child: Card(
              child: Container(
                height: 250,
                width:(_width-pSize)*0.25,
                child: Column(
                  children:[
                    Container(
                      width: (_width-pSize)*0.25,
                      height: 50,
                      child: Text(
                        "Sondaggio: luca suca?",
                        style: TextStyle(fontSize: 29,),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top:15),
                      height: 150,
                      width:(_width-pSize)*0.25,
                      child: PieChart(
                        PieChartData(
                          centerSpaceRadius: 0,
                          sections: [
                            new PieChartSectionData(
                              value:(35).toDouble(),color:Colors.indigoAccent,radius: 95,showTitle: true,title: "SI",titleStyle: TextStyle(fontSize: 16,color: currentTheme.currentTheme()==ThemeMode.light? new Color(0xffffffff): new Color(0xffffffff),)
                            ),
                            PieChartSectionData(value:(65).toDouble(),color:Colors.blue,radius: 95,showTitle: true,title:"SI, ma in blu",titleStyle: TextStyle(fontSize: 16,color: currentTheme.currentTheme()==ThemeMode.light? new Color(0xffffffff): new Color(0xffffffff))),
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
            top: 430,
            left: (_width-pSize)*(1/16)+2*(_width-pSize)*0.25+2*(_width-pSize)*(1/16),
          ),
        ],
      ),
    );
  }
}