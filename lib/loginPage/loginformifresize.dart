import 'package:flutter/material.dart';
import 'package:home/loginPage/autenticationWidget.dart';
import 'package:home/webApp/index.dart';

import '../webApp/applicationMainPages/graph.dart';

class LoginFormIf extends StatefulWidget {
  LoginFormIf({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginFormIf createState() => _LoginFormIf();
}

class _LoginFormIf extends State<LoginFormIf> {
  String stringa = 'Accedi';
  final mycontroller = TextEditingController();
  bool page = true;
  double cardheight;

  void dispose() {
    mycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    //double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 450;
    double allcontainerwidth = 580;
    if (page == true) {
      cardheight = 800 / 2.5;
    } else {
      cardheight = 800 / 2.0;
    }
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(bottom: _height / 20),
              height: _height / 5,
              width: 400,
              child: Image.asset('scrafblacklogo.png',
                  fit: BoxFit.fitWidth, alignment: Alignment.bottomCenter),
            ),
            Container(
              child: Card(
                elevation: 5,
                child: Container(
                  height: cardheight,
                  width: allcontainerwidth,
                  //color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Center(
                            child: Container(
                              width: containerwidth,
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                stringa,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 37),
                              ),
                            ),
                          ),
                          Container(
                            width: containerwidth,
                            margin: EdgeInsets.only(top: 15),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Inserisci username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                              controller: mycontroller,
                            ),
                          ),
                          page == false
                              ? Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: containerwidth,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      labelText: "Inserisci e-mail",
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(2.0),
                                        borderSide: BorderSide(),
                                      ),
                                    ),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              : Container(),
                          Container(
                            margin: EdgeInsets.only(top: 15),
                            width: containerwidth,
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Inserisci password",
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 35),
                            width: containerwidth,
                            child: Wrap(
                              children: [
                                SizedBox(
                                  width: 45,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 150,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        stringa = 'Accedi';
                                        page = true;
                                      });
                                      Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>Index(buildWho: Graph(), menuState: true),));
                                    },
                                    icon: Icon(
                                      Icons.login,
                                      size: 20,
                                    ),
                                    label: Text(
                                      'Accedi',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                SizedBox(
                                  height: 45,
                                  width: 150,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        stringa = 'Registrati';
                                        page = false;
                                        httpService();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.app_registration,
                                      size: 20,
                                    ),
                                    label: Text(
                                      'Registrati',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
