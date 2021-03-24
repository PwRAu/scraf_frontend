import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/sideMenu/icon_menu.dart';
import '../../global/config.dart';
import '../applicationMainPages/graph.dart';
import '../index.dart';
import '../../main.dart';
import '../applicationMainPages/settingsPage.dart';

class ListIcon extends StatefulWidget {
  final bool isMenuOpen;
  ListIcon({this.isMenuOpen});

  @override
  _ListIcon createState() => _ListIcon();
}

class _ListIcon extends State<ListIcon> {
  //bool isMenuOpen;
  //_ListIcon({this.isMenuOpen});
  bool isDropDownnActive = false;
  List<IconMmenu> menuIcons = [
    IconMmenu(
      iconLabel: "Home",
      iconName: Icons.home,
      who: MainPage(),
      isToBuild: true,
      sizeIcon: 35,
    ),
    IconMmenu(
      iconLabel: "Materie",
      iconName: Icons.arrow_drop_down,
      isToBuild: true,
      sizeIcon: 35,
    ),
    IconMmenu(
      iconLabel: "Matematica",
      iconName: Icons.mark_email_read,
      isToBuild: false,
      sizeIcon: 25,
    ),
    IconMmenu(
      iconLabel: "Impostazioni",
      iconName: Icons.settings,
      who: SettingsPage(),
      isToBuild: true,
      sizeIcon: 40,
    ),
    IconMmenu(
      iconLabel: "Esci",
      iconName: Icons.exit_to_app,
      isToBuild: true,
      sizeIcon: 40,
    ),
  ];

  Widget build(BuildContext context) {
    //print("lico: "+widget.isMenuOpen.toString());
    double _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height * 0.85,
      width: 300,
      child: ListView.builder(
        itemCount: menuIcons.length,
        itemBuilder: (context, i) {
          return SizedBox(
            child: menuIcons[i].isToBuild == true
                ? new InkWell(
                    onTap: () {
                      if (menuIcons[i].iconLabel == "Esci") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      } else if (menuIcons[i].iconLabel == "Materie") {
                        setState(() {
                          if (!isDropDownnActive) {
                            menuIcons = [
                              IconMmenu(
                                iconLabel: "Home",
                                iconName: Icons.home,
                                who: MainPage(),
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Materie",
                                iconName: Icons.arrow_drop_down,
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Matematica",
                                iconName: Icons.mark_email_read,
                                isToBuild: true,
                                who: Graph(),
                                sizeIcon: 25,
                              ),
                              IconMmenu(
                                iconLabel: "Impostazioni",
                                iconName: Icons.settings,
                                who: SettingsPage(),
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Esci",
                                iconName: Icons.exit_to_app,
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                            ];
                            isDropDownnActive = true;
                          } else {
                            menuIcons = [
                              IconMmenu(
                                iconLabel: "Home",
                                iconName: Icons.home,
                                who: MainPage(),
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Materie",
                                iconName: Icons.arrow_drop_down,
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Matematica",
                                iconName: Icons.mark_email_read,
                                isToBuild: false,
                                who: Graph(),
                                sizeIcon: 25,
                              ),
                              IconMmenu(
                                iconLabel: "Impostazioni",
                                iconName: Icons.settings,
                                who: SettingsPage(),
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                              IconMmenu(
                                iconLabel: "Esci",
                                iconName: Icons.exit_to_app,
                                isToBuild: true,
                                sizeIcon: 35,
                              ),
                            ];
                            isDropDownnActive = false;
                          }
                        });
                      } else {
                        builder = menuIcons[i].who;
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Index(
                              buildWho: menuIcons[i].who,
                              menuState: widget.isMenuOpen,
                            ),
                          ),
                        );
                      }
                    },
                    child: Column(
                      children: [
                        TweenAnimationBuilder(
                          duration: Duration(milliseconds: 00),
                          tween: Tween<double>(begin: 160, end: 160),
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 000),
                            width: 90,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    //margin: EdgeInsets.fromLTRB(marginClosed*100*0.25, 0, 0, 0),
                                    width: 50,
                                    height: 50,
                                    child: Icon(
                                      menuIcons[i]
                                          .iconName, //prendo l'oggetto dalla lista
                                      size: menuIcons[i].sizeIcon,
                                      color: Colors.white,
                                    )),
                                widget.isMenuOpen == true
                                    ? new TweenAnimationBuilder(
                                        duration: Duration(milliseconds: 00),
                                        tween:
                                            Tween<double>(begin: 105, end: 105),
                                        child: AnimatedContainer(
                                            width: 0,
                                            duration:
                                                Duration(milliseconds: 500),
                                            child: TweenAnimationBuilder(
                                              child: Text(
                                                menuIcons[i].iconLabel,
                                                style: menuIcons[i].sizeIcon ==
                                                        25
                                                    ? new TextStyle(
                                                        fontSize: 14,
                                                        color: Colors.white)
                                                    : new TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white),
                                              ),
                                              tween: Tween<double>(
                                                  begin: 1,
                                                  end:
                                                      1), //l'animazione è ancora presente ma non si vede perchè il range di cambiamento è uguale
                                              duration:
                                                  Duration(milliseconds: 500),
                                              builder: (BuildContext context,
                                                  double _tween, Widget child) {
                                                return Opacity(
                                                  opacity: _tween,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: _tween * 5),
                                                    child: child,
                                                  ),
                                                );
                                              },
                                            )),
                                        builder: (BuildContext context,
                                            double _sa, Widget child) {
                                          return Container(
                                            width: _sa,
                                            child: child,
                                          );
                                        },
                                      )
                                    : new Text(""),
                              ],
                            ),
                            decoration: BoxDecoration(
                                //color:Colors.lightBlue,
                                ),
                          ),
                          builder: (BuildContext context, double widthMenu,
                              Widget child) {
                            return Container(
                              child: child,
                              width: widthMenu,
                              height: 50,
                            );
                          },
                        ),
                        menuIcons[i].iconLabel == "Matematica"
                            ? new TweenAnimationBuilder(
                                duration: Duration(milliseconds: 500),
                                tween: Tween<double>(begin: 50, end: 80),
                                child: Container(
                                  width: 50,
                                  height: 1,
                                  color: Colors.white,
                                ),
                                builder: (BuildContext context,
                                    double widthSizedBox, Widget child) {
                                  return Container(
                                    width: widthSizedBox,
                                    child: child,
                                  );
                                },
                              )
                            : new SizedBox(),
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
                    ),
                  )
                : new Container(),
          );
        },
      ),
    );
  }
}
