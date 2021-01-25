import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/listIcon.dart';

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
    //print("menu page: "+isMenuOpen.toString());
    if(_width>=1000){
      return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        //width: _width*0.85*0.15*mul,
        width: 160*mul,
        height: 850,
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
                  //isMenuOpen==false?
                  //new SizedBox(width: 50, height: 50, child: Icon(Icons.menu)):new SizedBox(width: 50, height: 50, child: Icon(Icons.close)),
                  /*onTap: (){
                    setState(() {
                      if(!isMenuOpen){
                        mul = 1;
                        isMenuOpen=true;
                        marginClosed=0;
                      }else{
                        mul=0.6;
                        isMenuOpen=false;
                        marginClosed=1;
                      }
                      
                    });
                  }*/
                ),
              ),
              
            ),
            SizedBox(height: 10,),
            new ListIcon(isMenuOpen: isMenuOpen),
            
            /*
            TweenAnimationBuilder(
              duration: Duration(milliseconds:1000),
              tween: Tween<double>(begin: 90, end: 130),
              
              child: AnimatedContainer(
                duration: Duration(milliseconds:1000),
                width: 90,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    Container(
                      //margin: EdgeInsets.fromLTRB(marginClosed*100*0.25, 0, 0, 0),
                      width: 50,
                      height: 50,
                      child:Icon(
                        Icons.home,
                        size: 45,
                        color: Colors.white,
                      )
                    ),
                    isMenuOpen==true?
                    new TweenAnimationBuilder(
                      duration:Duration(milliseconds: 600),
                      tween: Tween<double>(begin: 40,end: 75),
                      child: AnimatedContainer(
                        width: 0,
                        duration: Duration(milliseconds: 600),
                        child:TweenAnimationBuilder(
                          child: Text(
                            "Home",
                            style: TextStyle(fontSize: 17,color: Colors.white),
                          ),
                          tween: Tween<double>(begin: 0, end: 1),
                          duration: Duration(milliseconds: 600),
                          builder: (BuildContext context, double _tween, Widget child){
                            return Opacity(
                              opacity: _tween,
                              child: Padding(
                                padding: EdgeInsets.only(left: _tween*5),
                                child: child,
                              ),
                            );
                          },
                        )
                      ),
                      builder: (BuildContext context, double _sa, Widget child){
                        return Container(
                          width: _sa,
                          child: child,
                        );
                      },
                    ):new Text(""),
                  ],
                ),
                decoration: BoxDecoration(
                  //color:Colors.lightBlue,
                ),
              ),
              builder: (BuildContext context, double widthMenu, Widget child){
                return Container(child: child,width: widthMenu,height: 50,);
              },
            ),
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 1000),
              tween: Tween<double>(begin: 50,end: 80),
              child:Container(
                width:50,
                height: 1,
                color: Colors.white,
              ),
              builder: (BuildContext context, double widthSizedBox,Widget child){
                return Container(
                  width: widthSizedBox,
                  child: child,
                );
              },
            )
            */
            
          ],
        ),
      );
    }else{
      return Container(
              width: 70,
              height: 850,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12),bottomLeft: Radius.circular(12)),

              ),
              child: Column(
                children:[
                  SizedBox(height:25),
                  ListIconMobile()
                ],
              ),
      );
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