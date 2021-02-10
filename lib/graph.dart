import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Graph extends StatefulWidget{
  _Graph createState()=> _Graph();
}

class _Graph extends State<Graph>{
    Widget build(BuildContext context) {
    //List<double> voti = new List(5);
    double _width = MediaQuery.of(context).size.width;
    double _height= MediaQuery.of(context).size.height;
    var voti = [4,5,1,5,7];
    
    /*
    for(int i=0;i<voti.length;i++){
      var r = new Random();
      double n = r.nextDouble()*10;
      voti[i] = n;
    }
    */

    if(_width>650){
      return  Container(
        //color: Colors.deepOrange,
        padding: EdgeInsets.only(top:50),
        width: _width*0.5,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children:[
            SizedBox(
              width: _width*0.4,
              height: 450,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    "Grafico prova",
                    style: TextStyle(
                      fontSize: 45,
                    ),
                  ),
                  SizedBox(height: 25),
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
                              FlSpot(0,voti[0].toDouble()),
                              FlSpot(4,voti[1].toDouble()),
                              FlSpot(7,voti[2].toDouble()),
                              FlSpot(11,voti[3].toDouble()),
                              FlSpot(15,voti[4].toDouble()),
                            ],
                            isCurved: true,
                            curveSmoothness: 0.5,
                            colors: [Colors.lightBlue],
                            
                            colorStops: null,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Colors.lightBlue].map((e) => e.withOpacity(0.3)).toList(),
                            ),
                            preventCurveOverShooting: true,
                          
                          ),
                          
                        ],
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.blueGrey,width: 2),
                        ),
                        
                      ),
                      
                    ),
                  ),
                  
                ]
              ),
            )
          ],
        ),
      );
    }else{
      return Container(
        width: _width,
        height: _height*0.85,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Container(
              //color: Colors.deepOrange[200],
              width: _width,
              height: 450,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 25),
                  Text(
                    "Grafico prova",
                    style: TextStyle(
                      fontSize: 29,
                    ),
                  ),
                  SizedBox(height: 25),
                  /*
                  Container(
                    height: 300,
                    width: _width*0.9,
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
                              FlSpot(0,voti[0].toDouble()),
                              FlSpot(4,voti[1].toDouble()),
                              FlSpot(7,voti[2].toDouble()),
                              FlSpot(11,voti[3].toDouble()),
                              FlSpot(15,voti[4].toDouble()),
                            ],
                            isCurved: true,
                            curveSmoothness: 0.5,
                            colors: [Colors.lightBlue],
                            
                            colorStops: null,
                            dotData: FlDotData(show: true),
                            belowBarData: BarAreaData(
                              show: true,
                              colors: [Colors.lightBlue].map((e) => e.withOpacity(0.3)).toList(),
                            ),
                            preventCurveOverShooting: true,
                          
                          ),
                          
                        ],
                        borderData: FlBorderData(
                          show: true,
                          border: Border.all(color: Colors.blueGrey,width: 2),
                        ),
                      ),
                      
                    ),
                  ),*/
                ]
              ),
            ),
          ],
        ),
      );
    }
  }
}

