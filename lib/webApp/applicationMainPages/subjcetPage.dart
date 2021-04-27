import 'package:flutter/cupertino.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';

// ignore: must_be_immutable
class SubjcetPage extends StatelessWidget {
  String name;
  MenuState stateM;
  SubjcetPage({this.name, this.stateM});
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    //print(_width - stateM.menuWidth);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: _width,
          height: 100,
          child: Center(
            child: Text(
              name,
              style: TextStyle(fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
