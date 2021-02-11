import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config.dart';


class SettingsPage extends StatefulWidget{  
  _SettingsPage createState()=> _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>{
  bool _light=false;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    
    if(box.containsKey('theme')){
      _light=box.get('theme');
    }else{
     _light=_light;
    }

    if(_width>650){
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
                      child:Column(
                        children:[
                          Text(
                            "Impostazioni",
                            style: TextStyle(fontSize:26),
                          ),
                          SizedBox(height:25),
                          Row(
                            children:[
                              Text("Dark theme",style: TextStyle(fontSize: 19)),
                              Switch(value: _light,onChanged: (state){
                                currentTheme.switchTheme();
                                setState(() {
                                  _light=state;
                                });
                              },
                              ),
                            ],
                          ),
                        ]
                      ),
                    )
                  ],
                ),
                /*
                decoration: BoxDecoration(
                  //color: Colors.white,
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
                ),*/
              ),
            ]
          ),
        )
      );
    }else{
      return Container(
        width: _width,
        height: _height*0.85,
        child: Column(
          children:[
            SizedBox(height:25),
            //Contiene la pagina
            Container(
              width: _width*0.85,
              height: _height*0.85,
              child: Column(
                children:[
                  Text("Settings",style: TextStyle(fontSize: 29),),
                  SizedBox(height:25),
                  Row(
                    children:[
                      Text("Dark theme",style: TextStyle(fontSize: 18),),
                      Switch(value: _light,onChanged: (state){
                        currentTheme.switchTheme();
                        setState(() {
                          _light=state;
                        });
                       },
                      ),
                    ]
                  )
                ]
              ),
            )
            
          ],
        ),
      );
    }
  }
  
}