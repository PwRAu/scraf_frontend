import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatelessWidget{
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    List<double> voti = new List(5);
    double _width = MediaQuery.of(context).size.width;
    
    for(int i=0;i<voti.length;i++){
      var r = new Random();
      double n = r.nextDouble()*10;
      voti[i] = n;
    }

    if(_width>650){
      return  Container(
        padding: EdgeInsets.only(top:50),
        width: _width*0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              width: _width*0.4,
              height: 450,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    "Grafico prova",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 45,
                    )
                  ),
                  SizedBox(height: 25),
                  Spacer(),
                  Container(
                    height: 300,
                    width: _width*0.35,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 15,
                        minY: 0,
                        maxY: 10,
                        //backgroundColor: Color(0xff4dd0e1),
                        lineBarsData: [
                          LineChartBarData(
                            spots:[
                              FlSpot(0,voti[0]),
                              FlSpot(4,voti[1]),
                              FlSpot(7,voti[2]),
                              FlSpot(11,voti[3]),
                              FlSpot(15,voti[4]),
                            ],
                            isCurved: true,
                            curveSmoothness: 0.5,
                            colors: [Color(0xff23b6e6)],
                            
                            colorStops: null,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Color(0xff23b6e6)].map((e) => e.withOpacity(0.3)).toList(),
                            ),
                            preventCurveOverShooting: true,
                          
                          ),
                          
                        ],
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d),width: 2),
                        ),
                        
                      ),
                      
                    ),
                  ),
                ]
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }else{
      return Container(
        width: _width*0.9,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text(
                    "Grafico prova",
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 45,
                    )
                  ),
                  SizedBox(height: 25),
                  Container(
                    height: 300,
                    width: _width,
                    child: LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 15,
                        minY: 0,
                        maxY: 10,
                        //backgroundColor: Color(0xff4dd0e1),
                        lineBarsData: [
                          LineChartBarData(
                            spots:[
                              FlSpot(0,voti[0]),
                              FlSpot(4,voti[1]),
                              FlSpot(7,voti[2]),
                              FlSpot(11,voti[3]),
                              FlSpot(15,voti[4]),
                            ],
                            isCurved: true,
                            curveSmoothness: 0.5,
                            colors: [Color(0xff23b6e6)],
                            
                            colorStops: null,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Color(0xff23b6e6)].map((e) => e.withOpacity(0.3)).toList(),
                            ),
                            preventCurveOverShooting: true,
                          
                          ),
                          
                        ],
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: const Color(0xff37434d),width: 2),
                        ),
                        
                      ),
                      
                    ),
                  ),
                ]
              ),    
          ]
        )
      );
    }
  }
}

