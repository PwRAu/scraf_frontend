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
      return  Material(
              child:Container(
                height: _height,
                width: _width,
                child: Center(
                  child:Container(
                    child: Container(
                      height: _height,
                      width: _width,
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
                          Scrollbar(
                            thickness: 8,
                            child:SingleChildScrollView(
                              reverse: false,
                              child:Container(
                                width: _width-224,
                                height: _height*2,
                                child: Column(
                                  children: [
                                    buildWho, //widget passato al costruttore
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
                height: _height*0.91,
                //La scrollbar serve a rendere la pagina scrollabile, in modo da avere lo spazio per 
                //più contenuti e lasciare sul fondo la barra di navigazione
                child: Scrollbar(
                  thickness: 8,
                  child: SingleChildScrollView(
                    child: Container(
                      height:_height*1.6,
                      child:buildWho),
                  ),
                ),
              ),
              //Container che contiene la barra inferiore di navigazione
              Container(
                child: MenuWidget(menuState: false,),
              ),
            ],
          ),
        ),
      );
    }
  }
}
