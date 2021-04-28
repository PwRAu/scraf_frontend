import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/applicationMainPages/settingsPage.dart';
import 'package:home/webApp/applicationMainPages/subjcetPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'sideMenu/menuWidget.dart';

// ignore: must_be_immutable
class Index extends StatefulWidget {
  final Widget buildWho; //Serve per decidere quale Widget mandare in esecuzione
  MenuState menuState; //è lo stato del menu, aperto o chiuso
  Index({this.buildWho, this.menuState}); //
  _Index createState() => _Index();
}

class _Index extends State<Index> {
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print("index: "+_width.toString());
    //print(sizeOfMainPage.pSize);
    if (_width >= 650) {
      return BlocProvider(
        create: (_) => MenuBloc(initial: widget.menuState),
        child: IndexDesktop(
          buildWho: widget.buildWho,
        ),
      );
    } else {
      return Material(
        child: Container(
          height: _height,
          width: _width,
          child: Column(
            children: [
              Container(
                height: _height * 0.91,
                //La scrollbar serve a rendere la pagina scrollabile, in modo da avere lo spazio per
                //più contenuti e lasciare sul fondo la barra di navigazione
                child: Scrollbar(
                  thickness: 8,
                  child: SingleChildScrollView(
                    child: Container(
                        height: _height * 1.6,
                        width: _width,
                        child: widget.buildWho),
                  ),
                ),
              ),
              //Container che contiene la barra inferiore di navigazione
              Container(
                child: MenuWidget(),
              ),
            ],
          ),
        ),
      );
    }
  }
}

class IndexDesktop extends StatefulWidget {
  final Widget buildWho;
  IndexDesktop({this.buildWho});
  _IndexDesktop createState() => _IndexDesktop();
}

class _IndexDesktop extends State<IndexDesktop> {
  void initState() {
    super.initState();
    //context.read<MenuBloc>().add(OpenMenuEvent());
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Material(
      child: Container(
        height: _height,
        width: _width,
        child: Center(
          child: Container(
            child: Container(
              height: _height,
              width: _width,
              //color: Colors.grey[300],
              child: Page(buildWho: widget.buildWho),
            ),
          ),
        ),
      ),
    );
  }
}

class Page extends StatefulWidget {
  final Widget buildWho;
  Page({this.buildWho});
  _Page createState() => _Page();
}

class _Page extends State<Page> {
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<MenuBloc, MenuState>(
      builder: (context, state) {
        //print("index: " + state.toString());
        return Row(
          children: [
            Column(
              children: [
                MenuWidget(
                  state: state,
                ),
              ],
            ),
            Scrollbar(
              thickness: 0,
              child: SingleChildScrollView(
                primary: false,
                reverse: false,
                child: Container(
                  width: state.menuOpen == null
                      ? (_width - 224)
                      : (_width - state.menuWidth),
                  height: _height * 2,
                  child: Column(
                    children: [
                      Bridge(
                        widgeToBuild: widget.buildWho,
                        state: state,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class Bridge extends StatelessWidget {
  final Widget widgeToBuild;
  final MenuState state;

  Bridge({this.widgeToBuild, this.state});

  Widget build(BuildContext context) {
    if (widgeToBuild is MainPage) {
      return MainPage(
        state: state,
      );
    } else if (widgeToBuild is SettingsPage) {
      return SettingsPage();
    } else if (widgeToBuild is SubjcetPage) {
      return widgeToBuild;
    }
    return SizedBox();
  }
}
