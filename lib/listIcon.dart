import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/graph.dart';
import 'package:home/icon_menu.dart';
import 'index.dart';
import 'settingsPage.dart';

class ListIcon extends StatefulWidget{
  final bool isMenuOpen;
  ListIcon({this.isMenuOpen});
  
  @override
  _ListIcon createState() => _ListIcon();
}

class _ListIcon extends State<ListIcon>{
  //bool isMenuOpen;
  //_ListIcon({this.isMenuOpen});
  final List<IconMmenu> menuIcons = [
    IconMmenu(iconLabel: "Home",iconName: Icons.home,who: Graph()),
    IconMmenu(iconLabel: "Impostazioni",iconName: Icons.settings, who: SettingsPage())
  ];

  

  Widget build(BuildContext context){
    
    //print("lico: "+widget.isMenuOpen.toString());
    
    return Container(
      height:500,
      width: 300,
      child:ListView.builder(
        itemCount: menuIcons.length,
        itemBuilder: (context,i){
          return InkWell(
            onTap:(){
              Navigator.push(context, PageRouteBuilder(pageBuilder:(_,__,___)=>Index(buildWho: menuIcons[i].who,menuState: widget.isMenuOpen,)));
            },
            child:Column(
              children: [
                TweenAnimationBuilder(
                  duration: Duration(milliseconds:300),
                  tween: Tween<double>(begin: 90, end: 160),
                  
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
                            menuIcons[i].iconName,//prendo l'oggetto dalla lista
                            size: 45,
                            color: Colors.white,
                          )
                        ),
                        widget.isMenuOpen==true?
                        new TweenAnimationBuilder(
                          duration:Duration(milliseconds: 500),
                          tween: Tween<double>(begin: 40,end: 105),
                          child: AnimatedContainer(
                            width: 0,
                            duration: Duration(milliseconds: 500),
                            child:TweenAnimationBuilder(
                              child: Text(
                                menuIcons[i].iconLabel,
                                style: TextStyle(fontSize: 17,color: Colors.white),
                              ),
                              tween: Tween<double>(begin: 0, end: 1),
                              duration: Duration(milliseconds: 500),
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
                //Riga sotto le icone
                /*
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
                )*/
              ],
            )
          );
        },
      ),
    );
  }
}

//Mobile

class ListIconMobile extends StatefulWidget{
  @override
  _ListIconMobile createState() => _ListIconMobile();
}

class _ListIconMobile extends State<ListIconMobile>{
  final List<IconMmenu> menuIcons = [
    IconMmenu(iconLabel: "Home",iconName: Icons.home,who: Graph()),
    IconMmenu(iconLabel: "Impostazioni",iconName: Icons.settings, who: SettingsPage())
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 300,
      child:ListView.builder(
        itemCount: menuIcons.length,
        itemBuilder: (context,i){
          return InkWell(
            onTap:(){
              Navigator.push(context, PageRouteBuilder(pageBuilder:(_,__,___)=>Index(buildWho: menuIcons[i].who)));
            },
              child: Column(
                children:[
                  SizedBox(height:10),
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
                            menuIcons[i].iconName,
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
                  /*
                  Container(
                    width:50,
                    height: 1,
                    color: Colors.white,
                  )
                  */
                ],
              ),
            );
        }
      ),
    );
  }
  
}