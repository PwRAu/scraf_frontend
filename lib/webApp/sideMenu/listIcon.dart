import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/webApp/sideMenu/icon_menu.dart';
import '../../global/config.dart';
import '../blocMenu/menu_bloc.dart';
import '../index.dart';
import '../../main.dart';
import '../applicationMainPages/settingsPage.dart';

List<IconMmenu> createListMenu(MenuState _state, bool _isToBuild) {
  List<IconMmenu> toReturn = [];
  toReturn.add(
    IconMmenu(
      iconLabel: "Home",
      iconName: Icons.home,
      who: MainPage(state: _state),
      isToBuild: true,
      sizeIcon: 35,
    ),
  );
  toReturn.add(
    IconMmenu(
      iconLabel: "Materie",
      iconName: Icons.arrow_drop_down,
      isToBuild: true,
      sizeIcon: 35,
    ),
  );
  for (int i = 0; i < subjects.length; i++) {
    toReturn.add(
      IconMmenu(
        iconLabel: subjects[i],
        iconName: Icons.donut_large,
        isToBuild: _isToBuild,
        who: SubjcetPage(
          name: subjects[i],
          stateM: _state,
        ),
        sizeIcon: 25,
      ),
    );
  }
  toReturn.add(
    IconMmenu(
      iconLabel: "Impostazioni",
      iconName: Icons.settings,
      who: SettingsPage(),
      isToBuild: true,
      sizeIcon: 35,
    ),
  );
  toReturn.add(
    IconMmenu(
      iconLabel: "Esci",
      iconName: Icons.exit_to_app,
      isToBuild: true,
      sizeIcon: 35,
    ),
  );
  return toReturn;
}

class ListIcon extends StatefulWidget {
  final MenuState state;
  ListIcon({this.state});

  @override
  _ListIcon createState() => _ListIcon();
}

class _ListIcon extends State<ListIcon> {
  //bool isMenuOpen;
  //_ListIcon({this.isMenuOpen});
  bool isDropDownnActive = false;
  // ignore: deprecated_member_use
  List<IconMmenu> menuIcons = new List<IconMmenu>(7);

  @override
  Widget build(BuildContext context) {
    menuIcons = createListMenu(widget.state, isDropDownnActive);
    /*
    menuIcons = [
      IconMmenu(
        iconLabel: "Home",
        iconName: Icons.home,
        who: MainPage(state: widget.state),
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
        //iconName: Icons.mark_email_read,
        isToBuild: isDropDownnActive,
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
    */

    //print("lico: "+widget.isMenuOpen.toString());
    double _height = MediaQuery.of(context).size.height;
    //print("list icon:" + widget.state.toString() + '\n');
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
                        //print(isDropDownnActive);
                        setState(() {
                          if (!isDropDownnActive) {
                            //createListMenu(widget.state, true);
                            isDropDownnActive = true;
                          } else {
                            //createListMenu(widget.state, false);
                            isDropDownnActive = false;
                          }
                        });
                      } else {
                        builder = menuIcons[i].who;

                        if (widget.state is MenuClose) {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  Index(
                                buildWho: menuIcons[i].who,
                                menuState:
                                    MenuClose(menuWidth: 96, menuOpen: false),
                              ),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        } else {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  Index(
                                buildWho: menuIcons[i].who,
                                menuState:
                                    MenuOpen(menuWidth: 224, menuOpen: true),
                              ),
                              transitionDuration: Duration(seconds: 0),
                            ),
                          );
                        }
                        /*
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => IndexDesktop(
                              buildWho: menuIcons[i].who,
                            ),
                          ),
                        );
                        */
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
                                widget.state.menuOpen == true
                                    ? SingleChildScrollView(
                                        primary: true,
                                        child: new TweenAnimationBuilder(
                                          duration: Duration(milliseconds: 00),
                                          tween: Tween<double>(
                                              begin: 105, end: 105),
                                          child: AnimatedContainer(
                                              width: 0,
                                              duration:
                                                  Duration(milliseconds: 500),
                                              child: TweenAnimationBuilder(
                                                child: Text(
                                                  menuIcons[i].iconLabel,
                                                  style: menuIcons[i]
                                                              .sizeIcon ==
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
                                                    double _tween,
                                                    Widget child) {
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
                                        ),
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
                                tween: Tween<double>(begin: 50, end: 125),
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
