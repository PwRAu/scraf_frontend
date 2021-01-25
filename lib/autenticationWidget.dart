import 'package:flutter/material.dart';
import 'package:home/graph.dart';
import 'index.dart';
class AutenticationWidget extends StatefulWidget{

  _AutenticationWidget createState() =>_AutenticationWidget();
}

class _AutenticationWidget extends State<AutenticationWidget>{
  String stringa='Accedi';
  bool page=true;
  int  counter=2;
  final myController = TextEditingController();

   void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context){
    double _width = MediaQuery.of(context).size.width;
    double _resize = 900;

    if(_width>=_resize){
      return Column(
        children: [
          FittedBox(
            child: Container(
              margin: EdgeInsets.fromLTRB(_width*0.004, 0, 0, 0),
              padding: EdgeInsets.only(top:25),
              
              width: _width*0.8*0.40,
              height: 460,
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
                    spreadRadius: 3,
                    blurRadius: 4,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children:[
                  Container(
                    width: _width*0.8*0.40*0.7,
                    height: 90,
                    decoration: BoxDecoration(
                      //border: Border.all(color: Colors.purple),
                      image: DecorationImage(
                      image: AssetImage('assets/slogo.jpg'),
                      fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    stringa,
                    style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800),
                  ),
                  Column(
                    children: <Widget>[
                      new Container(
                        padding: EdgeInsets.only(top:15),
                        width: _width*0.8*0.40*0.80,
                        height: 60,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Inserisci username",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                          ),
                          controller: myController,
                        ),
                      ),
                      page==false?
                      new Container(
                        padding: EdgeInsets.only(top:10),
                        width: _width*0.8*0.40*0.80,
                        //height: _height*0.7*0.90*0.15,
                        height: 55,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Inserisci e-mail",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                          ),
                        ),
                      ):
                      new Container(),
                      new Container(
                        padding: EdgeInsets.only(top:10),
                        width: _width*0.8*0.40*0.80,
                        height: 55,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            labelText: "Inserisci password",
                            fillColor: Colors.white,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(20.0),
                              borderSide: new BorderSide(
                              ),
                            ),
                          ),
                          style: new TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 18,
                          ),
                        ),
                      ),
                      
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    //width: _width*0.8*0.40*0.6,
                    child: Wrap(
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              stringa ='Accedi';
                              page=true;
                            });
                            if(myController.text.isNotEmpty){
                              return showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text('nome utente: '+myController.text),
                                );
                              }
                              );
                            }
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Index(buildWho: Graph(),menuState:false),));
                          },
                          icon: Icon(Icons.login, size: 18,),
                          label: Text('Accedi',style: TextStyle(fontSize: 18),),
                        ),
                        SizedBox(width: 10,height: 40,),
                        ElevatedButton.icon(
                          onPressed: () {
                              setState(() {
                                stringa ='Registrati';
                                page=false;
                              });
                          },
                          icon: Icon(Icons.app_registration, size: 18,),
                          label: Text('Registrati',style: TextStyle(fontSize: 18),),
                        ),
                      ],  
                    ),
                  ),
                ],
              ),
            )
          ),
        ],
      );
    }else{
      return Column(
      children: [
        FittedBox(
          child: Container(
            margin: EdgeInsets.fromLTRB(_width*0.004, 0, 0, 0),
            padding: EdgeInsets.only(top:25),
            
            width: _width*0.8*0.95,
            height: 462,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange)
            ),
            child: Column(
              children:[
                Container(
                  width: _width*0.8*0.95*0.55,
                  height: 90,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.purple),
                    image: DecorationImage(
                    image: AssetImage('assets/slogo.jpg'),
                    fit: BoxFit.fill,
                    ),
                  ),
                ),
                Text(
                  stringa,
                  style: TextStyle(fontSize: 26,fontWeight: FontWeight.w800),
                ),
                Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top:15),
                      width: _width*0.8*0.95*0.6,
                      height: 60,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Inserisci username",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                        controller: myController,
                      ),
                    ),
                    page==false?
                    new Container(
                      padding: EdgeInsets.only(top:10),
                      width: _width*0.8*0.95*0.6,
                      //height: _height*0.7*0.90*0.15,
                      height: 55,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Inserisci e-mail",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                      ),
                    ):
                    new Container(),
                    new Container(
                      padding: EdgeInsets.only(top:10),
                      width: _width*0.8*0.95*0.6,
                      height: 55,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Inserisci password",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 30,),
                Container(
                  //width: _width*0.8*0.40*0.6,
                  child: Wrap(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            stringa ='Accedi';
                            page=true;
                          });
                          if(myController.text.isNotEmpty){
                            return showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text('nome utente: '+myController.text),
                              );
                            }
                            );
                          }
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Index(buildWho: Graph()),));
                        },
                        icon: Icon(Icons.login, size: 18,),
                        label: Text('Accedi',style: TextStyle(fontSize: 18),),
                      ),
                      SizedBox(width: 10,height: 40,),
                      ElevatedButton.icon(
                        onPressed: () {
                            setState(() {
                              stringa ='Registrati';
                              page=false;
                            });
                        },
                        icon: Icon(Icons.app_registration, size: 18,),
                        label: Text('Registrati',style: TextStyle(fontSize: 18),),
                      ),
                    ],  
                  ),
                ),
              ],
            ),
          )
        ),
      ],
    );
    }
  }
}