import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home/httpRequest/httpPatch.dart';
import 'package:home/httpRequest/httpRequest.dart';

import '../../global/config.dart';

class SettingsPage extends StatefulWidget {
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  bool _light = false;
  bool readOnly = true;

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    FocusNode focusNode;
    if (box.containsKey('theme')) {
      _light = box.get('theme');
    } else {
      _light = _light;
    }

    if (_width > 650) {
      return Container(
        padding: EdgeInsets.only(top: 50),
        width: _width * 0.8,
        child: Column(
          children: [
            Center(
              child: Container(
                width: _width,
                child: Text(
                  "Impostazioni",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
            Container(
              width: _width,
              height: 125,
              //color: Colors.grey[100],
              child: Column(
                children: [
                  SizedBox(
                    width: _width,
                    height: 25,
                  ),
                  Container(
                    width: _width,
                    height: 75,
                    child: Row(
                      children: [
                        Text(
                          "Dark theme",
                          style: TextStyle(fontSize: 19),
                        ),
                        Switch(
                          value: _light,
                          onChanged: (state) {
                            currentTheme.switchTheme();
                            setState(() {
                              _light = state;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: _width,
              child: Card(
                child: Container(
                  width: _width,
                  height: 250,
                  child: Column(
                    children: [
                      SizedBox(
                        width: _width,
                        height: 15,
                      ),
                      Text(
                        "Aggiorna credenziali classeviva",
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Nome utente: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: TextFormField(
                              readOnly: readOnly,
                              focusNode: focusNode,
                              //initialValue: cvUser,
                              controller: usernameCV,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 120,
                            margin: EdgeInsets.only(left: 15),
                            child: Text(
                              "Password: ",
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Container(
                            width: 250,
                            child: TextFormField(
                              readOnly: readOnly,
                              focusNode: focusNode,
                              //initialValue: cvPwd,
                              controller: pwdCV,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                readOnly = false;
                              });
                            },
                            child: Text(
                              "Modifica",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              httpPatchCvInfo(context);
                              setState(() {
                                readOnly = true;
                              });
                            },
                            child: Text(
                              "Applica modifiche",
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: _width,
        height: _height * 0.85,
        child: Column(
          children: [
            SizedBox(height: 25),
            //Contiene la pagina
            Container(
              width: _width * 0.85,
              height: _height * 0.85,
              child: Column(
                children: [
                  Text(
                    "Settings",
                    style: TextStyle(fontSize: 29),
                  ),
                  SizedBox(height: 25),
                  Row(
                    children: [
                      Text(
                        "Dark theme",
                        style: TextStyle(fontSize: 18),
                      ),
                      Switch(
                        value: _light,
                        onChanged: (state) {
                          currentTheme.switchTheme();
                          setState(() {
                            _light = state;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

httpPatchCvCredential() async {
  //to do
  //PATCH CV
}
