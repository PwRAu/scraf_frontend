import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/global/config.dart';
import 'package:home/loginPage/registryreg.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';

import '../global/config.dart';
import 'blocForm/my_form_bloc.dart';
import 'loginItems.dart';

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

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _usernameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(EmailUnfocused(page: page));
        //FocusScope.of(context).requestFocus(_usernameFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(PasswordUnfocused(page: page));
      }
    });
    _usernameFocusNode.addListener(() {
      if (!_usernameFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(UsernameUnfocused());
      }
    });
  }

  @override
  Widget build(BuildContext contex) {
    double width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 460;
    double allcontainerwidth = 540;

    //email.text = "";
    //password.text = "";
    //username.text = "";

    if (page == true) {
      cardheight = 1150 / 3;
    } else {
      cardheight = 1200 / 2.4;
    }
    return BlocListener<MyFormBloc, MyFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionInProgress) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Submitting...')),
            );
        }
      },
      child: Container(
        child: Center(
          child: Column(
            children: [
              currentTheme.currentTheme() == ThemeMode.light
                  ? //In base al tema che è attivo cambio il logo
                  new Container(
                      margin: EdgeInsets.only(bottom: _height / 40),
                      height: _height / 3,
                      width: width / 4,
                      child: Image.asset(
                        'scrafblacklogo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                      ),
                    )
                  : new Container(
                      margin: EdgeInsets.only(bottom: _height / 40),
                      height: _height / 3,
                      width: width / 4,
                      child: Image.asset(
                        'scrafwhitelogo.png',
                        fit: BoxFit.fitWidth,
                        alignment: Alignment.bottomCenter,
                      ),
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
                                child: EmailInput(
                                  focusNode: _emailFocusNode,
                                  page: page,
                                )),
                            page == false
                                ? Container(
                                    margin: EdgeInsets.only(top: _height / 40),
                                    width: containerwidth,
                                    child: UserName(
                                      focusNode: _usernameFocusNode,
                                    ),
                                    /*TextFormField(
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
                                      //controller: email,
                                    ),*/
                                  )
                                : Container(),
                            Container(
                                margin: EdgeInsets.only(top: _height / 40),
                                width: containerwidth,
                                child: PasswordInput(
                                  focusNode: _passwordFocusNode,
                                  page: page,
                                )),
                            Container(
                              margin: EdgeInsets.only(top: _height / 40),
                              width: containerwidth,
                              child: Wrap(
                                children: [
                                  SizedBox(
                                    width: page == true ? 60 : 120,
                                  ),
                                  page == true
                                      ? new SizedBox(
                                          height: 40,
                                          width: 140,
                                          child: SubmitButton())
                                      : SizedBox(
                                          height: 40,
                                          width: 30,
                                          child: IconButton(
                                            icon: Icon(Icons.arrow_back_rounded,
                                                size: 22),
                                            onPressed: () {
                                              setState(() {
                                                stringa = 'Accedi';
                                                page = true;
                                                email.text = "";
                                                password.text = "";
                                                username.text = "";
                                              });
                                            },
                                          ),
                                        ),
                                  SizedBox(
                                    width: page == true ? 60 : 10,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 140,
                                    child: page == true
                                        ? ElevatedButton.icon(
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
                                          )
                                        : RegButton(),
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
      ),
    );
  }
}
