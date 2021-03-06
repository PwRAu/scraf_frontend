import 'dart:convert';
import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/settingsPage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:home/webApp/applicationMainPages/graph.dart';
import 'package:home/webApp/index.dart';

class LoginFormMobile extends StatefulWidget {
  _LoginFormMobile createState() => _LoginFormMobile();
}

class _LoginFormMobile extends State<LoginFormMobile> {
  String stringa = 'Accedi';
  bool page = true;
  double heightState = 500;
  int counter = 2;

  void dispose() {
    myController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
  return Column(
        children: [
          FittedBox(
              child: Container(
            margin: EdgeInsets.fromLTRB(_width * 0.1, 0, 0, 0),
            padding: EdgeInsets.only(top: 0),
            width: _width * 0.8 * 0.95,
            height: 400,
            /*
            decoration: BoxDecoration(
              border: Border.all(color: Colors.orange)
            ),
            */
            child: Column(
              children: [
                Container(
                  width: _width * 0.8 * 0.95 * 0.65,
                  height: 110,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.purple),
                    image: DecorationImage(
                      image: AssetImage('scrafblacklogo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  stringa,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
                Column(
                  children: <Widget>[
                    new Container(
                      padding: EdgeInsets.only(top: 15),
                      width: _width * 0.8 * 0.95,
                      height: 60,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Inserisci username",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        style: new TextStyle(
                          fontFamily: "Poppins",
                          fontSize: 18,
                        ),
                        controller: myController,
                      ),
                    ),
                    page == false
                        ? new Container(
                            padding: EdgeInsets.only(top: 10),
                            width: _width * 0.8 * 0.95,
                            //height: _height*0.7*0.90*0.15,
                            height: 55,
                            child: TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Inserisci e-mail",
                                fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              style: new TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                              ),
                            ),
                          )
                        : new Container(),
                    new Container(
                      padding: EdgeInsets.only(top: 10),
                      width: _width * 0.8 * 0.95,
                      height: 55,
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: "Inserisci password",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(2.0),
                            borderSide: new BorderSide(),
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
                SizedBox(
                  height: 30,
                ),
                Container(
                  //width: _width*0.8*0.40*0.6,
                  child: Wrap(
                    children: [
                      SizedBox(
                        width: 110,
                        height: 35,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              stringa = 'Accedi';
                              page = true;
                            });
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Index(
                                    buildWho: SettingsPage(),
                                    menuState: false,
                                  ),
                                ));
                          },
                          icon: Icon(
                            Icons.login,
                            size: 18,
                          ),
                          label: Text(
                            'Accedi',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                        height: 40,
                      ),
                      SizedBox(
                        width: 140,
                        height: 35,
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(() {
                              stringa = 'Registrati';
                              page = false;
                            });
                          },
                          icon: Icon(
                            Icons.app_registration,
                            size: 18,
                          ),
                          label: Text(
                            'Registrati',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      );
  }
}