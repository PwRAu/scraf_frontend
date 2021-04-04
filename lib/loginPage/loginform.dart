import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:home/webApp/index.dart';

import '../global/config.dart';

httpService() async {
  // set up POST request arguments
  String url = 'https://server.mfrancolino.it/students';
  Map<String, String> headers = {"Content-Type": " application/json"};
  String json = '{"mail":"' +
      email.text +
      '","password":"' +
      password.text +
      '","name":"' +
      username.text +
      '","surname":"gioia"}';

  http.Response response = await http.post(url, headers: headers, body: json);

  int statusCode = response.statusCode;

  print(response.body);
  print(statusCode);
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginForm createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  String stringa = 'Accedi';
  bool page = true;
  double cardheight;

  void dispose() {
    username.dispose();
    password.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext contex) {
    double width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 460;
    double allcontainerwidth = 540;

    if (page == true) {
      cardheight = 950 / 3;
    } else {
      cardheight = 950 / 2.4;
    }

    return Container(
      child: Center(
        child: Column(
          children: [
            currentTheme.currentTheme() == ThemeMode.light
                ? //In base al tema che è attivo cambio il logo
                new Container(
                    margin: EdgeInsets.only(bottom: _height / 40),
                    height: _height / 3,
                    width: width / 4,
                    child: Image.asset('scrafblacklogo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter),
                  )
                : new Container(
                    margin: EdgeInsets.only(bottom: _height / 40),
                    height: _height / 3,
                    width: width / 4,
                    child: Image.asset('scrafwhitelogo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter),
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
                              margin: EdgeInsets.only(top: _height / 40),
                              child: Text(
                                stringa,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 40),
                              ),
                            ),
                          ),
                          Container(
                            width: containerwidth,
                            margin: EdgeInsets.only(top: _height / 40),
                            child: TextFormField(
                              decoration: InputDecoration(
                                labelText: "Inserisci username",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(2.0),
                                  borderSide: BorderSide(),
                                ),
                              ),
                              style: TextStyle(
                                fontSize: 18,
                              ),
                              controller: username,
                            ),
                          ),
                          page == false
                              ? Container(
                                  margin: EdgeInsets.only(top: _height / 40),
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
                                      fontSize: 18,
                                    ),
                                    controller: email,
                                  ),
                                )
                              : Container(),
                          Container(
                            margin: EdgeInsets.only(top: _height / 40),
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
                                fontSize: 18,
                              ),
                              controller: password,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: _height / 40),
                            width: containerwidth,
                            child: Wrap(
                              children: [
                                SizedBox(
                                  width: 60,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
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
                                            buildWho: MainPage(),
                                            menuState: MenuOpen(
                                                menuWidth: 224, menuOpen: true),
                                          ),
                                        ),
                                      );
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
                                  width: 60,
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: ElevatedButton.icon(
                                    onPressed: () {
                                      setState(() {
                                        stringa = 'Registrati';
                                        if (!page) httpService();
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
