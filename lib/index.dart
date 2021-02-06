import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menuWidget.dart';

class Index extends StatelessWidget {
  final Widget buildWho; //Serve per decidere quale Widget mandare in esecuzione
  final bool menuState; //è lo stato del menu, aperto o chiuso
  Index({this.buildWho, this.menuState}); //

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print("index: "+_width.toString());
    if(_width>=650){
      return Scrollbar(
        thickness: 8,
        child: SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: Material(
            child: Container(
              height: 800,
              width: _width,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    left: _width * 0.014,
                    right: _width * 0.014
                  ),
                  height: 750*0.85,
                  width: _width * 0.85,
                  //color: Colors.grey[300],
                  child: Row(
                    children: [
                      Column(
                        children: [
                          menuState==null?
                          new MenuWidget(
                            menuState: false,
                          ):new MenuWidget(
                            menuState: menuState,
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          buildWho, //widget passato al costruttore
                        ],
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }else{
      return Material(
        child:Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: _height*0.9,
                child: buildWho,
              ),
              Container(
                color: Colors.blueAccent,
                child: MenuWidget(menuState: false,),
              ),
            ],
          ),
        ),
      );
    }
  }
}
