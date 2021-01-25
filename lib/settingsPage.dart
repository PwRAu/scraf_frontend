import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SettingsPage extends StatefulWidget{  
  _SettingsPage createState()=> _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>{
  
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
   
    return Flexible(
      flex: 1,
      child:Container(
      padding: EdgeInsets.only(top:50),
      width: _width*0.6,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Container(
            width: _width*0.35,
            height: 500,
            //color: Colors.grey[100],
            child: Column(
              children:[
                Center(
                  child:Container(
                    padding: EdgeInsets.only(top:15),
                    child:Text(
                      "Settings",
                      style: TextStyle(fontSize:26),
                    )
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10)
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
        ]
      ),
      )
    );
  }
  
}