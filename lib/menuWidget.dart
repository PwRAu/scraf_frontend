import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/listIcon.dart';

import 'listIcon.dart';
import 'listIconMobile.dart';
import 'listIconTablet.dart';

// ignore: must_be_immutable
class MenuWidget extends StatefulWidget{
  bool menuState;
  MenuWidget({this.menuState});
  _MenuWidget createState() => _MenuWidget();
}

class _MenuWidget extends State<MenuWidget>{
  double mul;
  bool isMenuOpen;
  double marginClosed=1;
  
  @override
  Widget build(BuildContext context) {
    isMenuOpen=widget.menuState;
    if(!isMenuOpen){
      mul=0.6;
    }else{
      mul=1.4;
    }
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print("menu page: "+isMenuOpen.toString());
    if(_width>=1000){
      return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        //width: _width*0.85*0.15*mul,
        width: 160*mul,
        height: 750*0.85,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),

        ),
        child: Column(
          children:[
            SizedBox(height:20),
            ClipOval(
              child: Container(
                color: Colors.white,
                child: InkWell(
                  child: AnimatedIconButton(
                    startIcon: isMenuOpen==false? new Icon(Icons.menu):new Icon(Icons.close), 
                    endIcon: isMenuOpen==false? new Icon(Icons.close):new Icon(Icons.menu), 
                      onPressed: (){
                        setState(() {
                          if(!isMenuOpen){
                            mul = 1.4;
                            isMenuOpen=true;
                            marginClosed=0;
                            widget.menuState=true;
                            //print("menu page2: "+isMenuOpen.toString());
                          }else{
                            mul=0.6;
                            isMenuOpen=false;
                            widget.menuState=false;
                            marginClosed=1;
                          }
                          
                        });
                      },duration: Duration(milliseconds: 600),),
                ),
              ),
              
            ),
            SizedBox(height: 10,),
            new ListIcon(isMenuOpen: isMenuOpen),            
          ],
        ),
      );
    }else{
      if(_width>=650){
        return Container(
          width: 70,
          height: 750*0.85,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),

          ),
          child: Column(
            children:[
              SizedBox(height:25),
              ListIconTablet(),
            ],
          ),
        );
      }else{
        //Menu a icone mostrato su smartphone
        return Container(
          width: _width,
          height: _height*0.15,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
          ),
          child:Row(
            children: [
              ListIconMobile(),
            ],
          ),
        );
      }
      /*return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        width: 90,
        height: 848,
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),

        ),
        child: Column(
          children:[
            SizedBox(height:30),
            AnimatedContainer(
              duration: Duration(milliseconds:500),
              width: 50,
              height: 50,
              child: Row(
                children:[
                  Container(
                    width: 50,
                    height: 50,
                    child:Icon(
                      Icons.home,
                      size: 50,
                      color: Colors.white,
                    )
                  ),
                ],
              ),
              decoration: BoxDecoration(
                //color:Colors.green,
              ),
            ),
            Container(
              width:50,
              height: 1,
              color: Colors.white,
            )
          ],
        ),
      );
      */
    }
  }
    
  
}
