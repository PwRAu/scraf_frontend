import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/autenticationWidget.dart';
import 'package:home/imageHomeWidget.dart';
import 'imageHomeWidget.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Material(
      //color: Colors.white,
      child: Column(
        children: [
          _width >= 900
              ? new Container(
                  padding: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: _width * 0.014,
                      right: _width * 0.014),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: _width * 0.8,
                  height: _height,
                  child: Row(
                    children: [
                      //ImageHomeWidget(),
                      AutenticationWidget(),
                    ],
                  ),
                  /*
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 12,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              */
              )
              : new Container(
                  padding: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: _width * 0.014,
                      right: _width * 0.014),
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
                  width: _width,
                  height: _height,
                  child: Row(
                    children: [
                      //ImageHomeWidget(),
                      AutenticationWidget(),
                    ],
                  ),
                ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
