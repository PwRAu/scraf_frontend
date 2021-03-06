import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../applicationMainPages/graph.dart';
import 'package:home/webApp/sideMenu/icon_menu.dart';
import '../index.dart';
import '../../main.dart';
import '../applicationMainPages/settingsPage.dart';

class ListIconMobile extends StatefulWidget{
  _ListIconMobile createState() => _ListIconMobile();
}

class _ListIconMobile extends State<ListIconMobile>{
  final List<IconMmenu> menuIcons = [
    IconMmenu(iconLabel: "Home", iconName: Icons.home, who: Graph()),
    IconMmenu(iconLabel: "Sos", iconName: Icons.follow_the_signs, who: Graph()),
    IconMmenu(
      iconLabel: "Impostazioni",
      iconName: Icons.settings,
      who: SettingsPage(),
    ),
    IconMmenu(iconLabel: "Esci", iconName: Icons.exit_to_app),
  ];

  @override
  Widget build(BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    
    return Container(
      width: _width,
      height: 75,
      child:ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: menuIcons.length,
            itemBuilder: (context, i) {
              return InkWell(
                  onTap: () {
                  if (menuIcons[i].iconLabel == "Esci") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyApp(),
                      ),    
                    );
                  } else {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Index(
                                  buildWho: menuIcons[i].who,
                                )));
                  }
                },
                child: Column(
                  children:[
                    SizedBox(height: 3,width: _width/menuIcons.length,),
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 50,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              child: Icon(
                                menuIcons[i].iconName,
                                size: 35,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          ),
    );
  }
}