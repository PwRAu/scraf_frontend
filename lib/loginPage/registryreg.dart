import 'package:flutter/cupertino.dart';
import 'package:home/global/config.dart';
import 'package:home/loginPage/homepage.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/index.dart';

import '../global/config.dart';

class RegisterRegistration extends StatefulWidget {
  _RegisterRegistration createState() => _RegisterRegistration();
}

class _RegisterRegistration extends State<RegisterRegistration> {
  bool isToDisplay = false;
  int _groupValue = 0;
  double cardheight = 200;
  bool _isButtonActive = true;
  Widget build(BuildContext context) {
    //double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 450;
    double allcontainerwidth = 580;
    return Container(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            currentTheme.currentTheme() == ThemeMode.light
                ? //In base al tema che è attivo cambio il logo
                new Container(
                    margin: EdgeInsets.only(bottom: _height / 20),
                    height: _height / 5,
                    width: 400,
                    child: Image.asset('scrafblacklogo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter),
                  )
                : new Container(
                    margin: EdgeInsets.only(bottom: _height / 20),
                    height: _height / 5,
                    width: 400,
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
                              margin: EdgeInsets.only(top: 20),
                              child: Text(
                                "Credenziali classeviva",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 37),
                              ),
                            ),
                          ),
                          isToDisplay == false
                              ? new Column(
                                  children: [
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Possiedi un account classeviva",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          value: 1,
                                          groupValue: _groupValue,
                                          onChanged: (T) => {
                                            setState(() {
                                              _groupValue = 1;
                                              cardheight = 450;
                                              isToDisplay = true;
                                            }),
                                          },
                                        ),
                                        Text(
                                          "Si",
                                        ),
                                        SizedBox(width: 50),
                                        Radio(
                                          value: 2,
                                          groupValue: _groupValue,
                                          onChanged: (T) => {
                                            setState(
                                              () {
                                                _groupValue = 2;
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) => Index(
                                                      buildWho: MainPage(),
                                                      menuState: MenuOpen(
                                                        menuWidth: 224,
                                                        menuOpen: true,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          },
                                        ),
                                        Text("No"),
                                      ],
                                    ),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      width: containerwidth,
                                      margin: EdgeInsets.only(top: 15),
                                      child: TextFormField(
                                        //initialValue: state.email.value,
                                        //controller: username,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.person),
                                          labelText: 'Username',
                                          helperMaxLines: 2,
                                          helperText:
                                              'Inserire il nome utente di classeviva',
                                          errorMaxLines: 2,
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      width: containerwidth,
                                      child: TextFormField(
                                        //initialValue: state.email.value,
                                        //controller: username,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.lock),
                                          labelText: 'Password',
                                          helperMaxLines: 2,
                                          helperText:
                                              'Inserire la password di classeviva',
                                          errorMaxLines: 2,
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 15),
                                      width: containerwidth,
                                      child: TextFormField(
                                        //initialValue: state.email.value,
                                        //controller: username,
                                        decoration: InputDecoration(
                                          icon: const Icon(Icons.lock),
                                          labelText: 'Conferma Password',
                                          helperMaxLines: 2,
                                          helperText: 'Conferma la password',
                                          errorMaxLines: 2,
                                        ),
                                        keyboardType: TextInputType.name,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 35),
                                      width: containerwidth,
                                      child: Wrap(
                                        children: [
                                          SizedBox(
                                            width: 120,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 40,
                                            child: IconButton(
                                              splashRadius: 22,
                                              icon: Icon(
                                                Icons.arrow_back_rounded,
                                                size: 22,
                                              ),
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        HomePage(),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          SizedBox(
                                            height: 40,
                                            width: 140,
                                            child: ElevatedButton.icon(
                                              onPressed: _isButtonActive
                                                  ? () => Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              Index(
                                                            buildWho:
                                                                MainPage(),
                                                            menuState: MenuOpen(
                                                              menuWidth: 224,
                                                              menuOpen: true,
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                  : null,
                                              icon: Icon(
                                                Icons.app_registration,
                                                size: 18,
                                              ),
                                              label: Text(
                                                'Registrati',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
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
