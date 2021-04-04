import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/webApp/sideMenu/listIcon.dart';

import '../../global/config.dart';
import 'listIconMobile.dart';
import 'listIconTablet.dart';

// ignore: must_be_immutable
class MenuWidget extends StatefulWidget {
  MenuState state;
  MenuWidget({this.state});
  _MenuWidget createState() => _MenuWidget();
}

class _MenuWidget extends State<MenuWidget> {
  double mul;
  bool isMenuOpen = false;
  double marginClosed = 1;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print("menu page: " + widget.state.menuOpen.toString());
    if (_width >= 1000) {
      return AnimatedContainer(
        duration: Duration(milliseconds: 0),
        //width: _width*0.85*0.15*mul,
        width: widget.state.menuWidth,
        height: _height,
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Container(
                    child: InkWell(
                      child: AnimatedIconButton(
                        startIcon: widget.state.menuOpen == false
                            ? new Icon(
                                Icons.menu,
                                color: Colors.white,
                              )
                            : new Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                        endIcon: widget.state.menuOpen == false
                            ? new Icon(
                                Icons.close,
                                color: Colors.white,
                              )
                            : new Icon(
                                Icons.menu,
                                color: Colors.white,
                              ),
                        onPressed: () {
                          //print(state);
                          if (widget.state is MenuOpen) {
                            context.read<MenuBloc>().add(CloseMenuEvent());
                          } else if (widget.state is MenuClose) {
                            context.read<MenuBloc>().add(OpenMenuEvent());
                          }
                        },
                        duration: Duration(milliseconds: 600),
                      ),
                    ),
                  ),
                ),
                widget.state.menuOpen == true
                    ? new Text(
                        "SCRAF",
                        style: TextStyle(color: Colors.white, fontSize: 21),
                      )
                    : new SizedBox(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            new ListIcon(state: widget.state),
          ],
        ),
        decoration: currentTheme.currentTheme() == ThemeMode.dark
            ? new BoxDecoration(color: Colors.greenAccent[200])
            : new BoxDecoration(color: Colors.blueAccent),
      );
    } else {
      if (_width >= 650) {
        return Container(
          width: 70,
          height: _height,
          decoration: currentTheme.currentTheme() == ThemeMode.dark
              ? new BoxDecoration(color: Colors.greenAccent[200])
              : new BoxDecoration(color: Colors.blueAccent),
          child: Column(
            children: [
              SizedBox(height: 25),
              ListIconTablet(),
            ],
          ),
        );
      } else {
        //Menu a icone mostrato su smartphone
        return Container(
          width: _width,
          height: _height * 0.09,
          decoration: currentTheme.currentTheme() == ThemeMode.dark
              ? new BoxDecoration(color: Colors.greenAccent[200])
              : new BoxDecoration(color: Colors.blueAccent),
          child: Row(
            children: [
              ListIconMobile(),
            ],
          ),
        );
      }
    }
  }
}
