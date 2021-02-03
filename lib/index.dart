import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'menuWidget.dart';

class Index extends StatelessWidget {
  final Widget buildWho; //Serve per decidere quale Widget mandare in esecuzione
  final bool menuState;
  Index({this.buildWho, this.menuState});

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print("index: "+menuState.toString());
    return Scrollbar(
      thickness: 8,
      child: SingleChildScrollView(
        child: Material(
          child: Container(
            height: _height,
            child: Center(
              child: Container(
                margin: EdgeInsets.only(
                    top: 50,
                    bottom: 50,
                    left: _width * 0.014,
                    right: _width * 0.014),
                height: 850,
                width: _width * 0.85,
                //color: Colors.grey[300],
                child: Row(
                  children: [
                    Column(
                      children: [
                        MenuWidget(
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
  }
}
