import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/graph.dart';
import 'package:home/webApp/sideMenu/icon_menu.dart';
import '../index.dart';
import '../../main.dart';
import '../applicationMainPages/settingsPage.dart';

class ListIconTablet extends StatefulWidget {
  @override
  _ListIconTablet createState() => _ListIconTablet();
}

class _ListIconTablet extends State<ListIconTablet> {
  final List<IconMmenu> menuIcons = [
    IconMmenu(iconLabel: "Home", iconName: Icons.home, who: Graph()),
    IconMmenu(
      iconLabel: "Impostazioni",
      iconName: Icons.settings,
      who: SettingsPage(),
    ),
    IconMmenu(iconLabel: "Esci", iconName: Icons.exit_to_app),
  ];

  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height;
    return Container(
      height: 700*0.85,
      width: 300,
      child: ListView.builder(
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
                children: [
                  SizedBox(height: 10),
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
                              size: 50,
                              color: Colors.white,
                            )),
                      ],
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
          }),
    );
  }
}
