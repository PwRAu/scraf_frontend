import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/global/config.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';

import '../global/config.dart';
import 'blocForm/my_form_bloc.dart';
import 'loginItems.dart';

class LoginFormIf extends StatefulWidget {
  LoginFormIf({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginFormIf createState() => _LoginFormIf();
}

class _LoginFormIf extends State<LoginFormIf> {
  String stringa = 'Accedi';
  bool page = true;
  double cardheight;
  final _emailFocusNodeP = FocusNode();
  final _passwordFocusNodeP = FocusNode();
  final _usernameFocusNodeP = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNodeP.addListener(() {
      if (!_emailFocusNodeP.hasFocus) {
        context.read<MyFormBloc>().add(EmailUnfocused(page: page));
        //FocusScope.of(context).requestFocus(_usernameFocusNode);
      }
    });
    _passwordFocusNodeP.addListener(() {
      if (!_passwordFocusNodeP.hasFocus) {
        context.read<MyFormBloc>().add(PasswordUnfocused(page: page));
      }
    });
    _usernameFocusNodeP.addListener(() {
      if (!_usernameFocusNodeP.hasFocus) {
        context.read<MyFormBloc>().add(UsernameUnfocused());
      }
    });
  }

  @override
  Widget build(BuildContext contex) {
    //double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 450;
    double allcontainerwidth = 580;
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
                                  stringa,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 37),
                                ),
                              ),
                            ),
                            Container(
                              width: containerwidth,
                              margin: EdgeInsets.only(top: 15),
                              child: EmailInput(
                                focusNode: _emailFocusNodeP,
                                page: page,
                              ),
                            ),
                            page == false
                                ? Container(
                                    width: containerwidth,
                                    margin: EdgeInsets.only(top: 15),
                                    child: UserName(
                                        focusNode: _usernameFocusNodeP),
                                  )
                                : Container(),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: containerwidth,
                              child: PasswordInput(
                                focusNode: _passwordFocusNodeP,
                                page: page,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 35),
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
                                          child: SubmitButton(),
                                        )
                                      : SizedBox(
                                          height: 40,
                                          width: 40,
                                          child: IconButton(
                                            splashRadius: 22,
                                            icon: Icon(
                                              Icons.arrow_back_rounded,
                                              size: 22,
                                            ),
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
