import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/loginPage/loginform.dart';
import 'package:home/loginPage/loginmobile.dart';
import 'package:home/loginPage/textscroll.dart';

import 'loginformifresize.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    /*
    return Material(
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
  */
  double resize = 1700;
    if (_width >= resize) {
      return Material(
        child: Container(
          width: _width,
          child: Row(
            children: [
              Container(
                
                height: _height,
                width: _width / 2,
                child: Photo(),
              ),
              Container(
                height: _height,
                width: _width / 2,
                child: LoginForm(),
              ),
            ],
          ),
        ),
      );
    } else if(_width>=900) {
      return Material(
        child: Container(
          height: _height,
          width: _width,
          child: LoginFormIf(),
        ),
      );
    }else{
      return Material(
        child: Container(
          height: _height*1.2,
          width: _width,
          padding: EdgeInsets.only(
                      top: 18,
                      bottom: 18,
                      left: _width * 0.014,
                      right: _width * 0.014),
                  margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: Row(
            children: [
              LoginFormMobile(),
            ],
          ),
        ),
      );
    }
  }

}
