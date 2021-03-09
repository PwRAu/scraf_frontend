import 'package:flutter/material.dart';
import 'package:home/loginPage/loginform.dart';
import 'package:http/http.dart' as http;
import '../global/config.dart';
import '../webApp/index.dart';
import '../webApp/applicationMainPages/settingsPage.dart';
import 'dart:convert';

/*
  httpService() async {
    // set up POST request arguments
    String url = 'https://api.scraf.pappacoda.it/students';
    Map<String, String> headers = {"Content-type": " application/json"};
    String json = '{"mail":"bellafrancolino@sos.it","password":"1234","name":"alessandro","surname":"gioia"}';

    http.Response response = await http.post(url,headers: headers, body: jsonEncode(json));

    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    //String body = response.body;
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
    print(response.body);
    print(statusCode);
  }
class AutenticationWidget extends StatefulWidget {
  _AutenticationWidget createState() => _AutenticationWidget();
}

class _AutenticationWidget extends State<AutenticationWidget> {
  String stringa = 'Accedi';
  bool page = true;
  double heightState = 500;
  int counter = 2;

  void dispose() {
    username.dispose();
    super.dispose();
  }

  
  /*
  _makeGetRequest() async {
    // make GET request
    //String url = 'https://api.jsonbin.io/b/5e1219328d761771cc8b9394';
    String url = 'https://api.scraf.pappacoda.it/students/name=Andrea';
    http.Response response = await http.get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String json = response.body;
    print(response.body);
  }
  */

  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _resize = 900;

    if (_width >= _resize) {
      return Column(
        children: [
          FittedBox(
            child: Card(
                elevation: 1.5,
                margin: EdgeInsets.only(left: _width * 0.2),
                child: Container(
                  //color: Theme.of(context).cardColor,
                  margin: EdgeInsets.fromLTRB(_width * 0, 0, 0, 0),
                  padding: EdgeInsets.only(top: 25),
                  width: _width * 0.8 * 0.50,
                  height: heightState,

                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(top:5),
                        width: _width * 0.8 * 0.40 * 0.7,
                        height: 110,
                        decoration: BoxDecoration(
                          //border: Border.all(color: Colors.purple),
                          image: DecorationImage(
                            image: AssetImage('slogo.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 35, 0, 15),
                        child: Text(
                          stringa,
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Column(
                        children: <Widget>[
                          new Container(
                            margin: EdgeInsets.only(top: 15),
                            width: _width * 0.8 * 0.40 * 0.80,
                            height: 60,
                            child: TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Inserisci username",
                                //fillColor: Colors.white,
                                border: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(2.0),
                                  borderSide: new BorderSide(),
                                ),
                              ),
                              style: new TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 18,
                              ),
                              controller: username,
                            ),
                          ),
                          page == false
                              ? new Container(
                                  margin: EdgeInsets.only(top: 10),
                                  width: _width * 0.8 * 0.40 * 0.80,
                                  //height: _height*0.7*0.90*0.15,
                                  height: 60,
                                  child: TextFormField(
                                    decoration: new InputDecoration(
                                      labelText: "Inserisci e-mail",
                                      fillColor: Colors.white,
                                      border: new OutlineInputBorder(
                                        borderRadius:
                                            new BorderRadius.circular(2.0),
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
                            margin: EdgeInsets.only(top: 10),
                            width: _width * 0.8 * 0.40 * 0.80,
                            height: 60,
                            child: TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Inserisci password",
                                //fillColor: Colors.white,
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
                              width: 180,
                              height: 40,
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
                                            menuState: true),
                                      ));
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
                              width: 10,
                              height: 65,
                            ),
                            SizedBox(
                              width: 180,
                              height: 40,
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  setState(() {
                                    stringa = 'Registrati';
                                    heightState = 550;
                                    if(page)httpService();
                                    page = false;
                                    
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
                )),
          )
        ],
      );
    } else {
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
                  width: _width * 0.8 * 0.95 * 0.55,
                  height: 90,
                  decoration: BoxDecoration(
                    //border: Border.all(color: Colors.purple),
                    image: DecorationImage(
                      image: AssetImage('slogo.png'),
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
                        controller: username,
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
}
*/