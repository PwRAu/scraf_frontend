import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/index.dart';

import '../global/config.dart';
import 'blocForm/my_form_bloc.dart';

httpService() async {
  // set up POST request arguments
  /*
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
  */
  print(email.text);
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

  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailFocusNode.addListener(() {
      if (!_emailFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(EmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(PasswordUnfocused());
      }
    });
  }

  @override
  Widget build(BuildContext contex) {
    double width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    double containerwidth = 460;
    double allcontainerwidth = 540;

    if (page == true) {
      cardheight = 1150 / 3;
    } else {
      cardheight = 1150 / 2.4;
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
                                child: EmailInput(
                                  focusNode: _emailFocusNode,
                                )),
                            page == false
                                ? Container(
                                    margin: EdgeInsets.only(top: _height / 40),
                                    width: containerwidth,
                                    child: UserName(),
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
                                )),
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
                                      child: SubmitButton()),
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
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return TextFormField(
          //initialValue: state.email.value,
          controller: email,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            helperText: 'Email valida, es: luca@suca.it',
            errorText: state.email.invalid
                ? 'Controlla di aver inserito una email nel formato corretto'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<MyFormBloc>().add(EmailChanged(email: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class UserName extends StatelessWidget {
  const UserName({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      //initialValue: state.email.value,
      controller: username,
      focusNode: focusNode,
      decoration: InputDecoration(
        icon: const Icon(Icons.person),
        labelText: 'Username',
        helperText: 'Inserire un nome utente',
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key key, this.focusNode}) : super(key: key);

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return TextFormField(
          //initialValue: state.password.value,
          controller: password,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.lock),
            helperText:
                '''La password deve esere di almeno 8 caratteri e con almemo un numero e una lettera''',
            helperMaxLines: 2,
            labelText: 'Password',
            errorMaxLines: 2,
            errorText: state.password.invalid
                ? '''La password deve esere di almeno 8 caratteri e contenere almemo un numero e una lettera'''
                : null,
          ),
          obscureText: true,
          onChanged: (value) {
            context.read<MyFormBloc>().add(PasswordChanged(password: value));
          },
          textInputAction: TextInputAction.done,
        );
      },
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton.icon(
          icon: Icon(Icons.login, size: 18),
          onPressed: state.status.isValidated
              ? () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Index(
                        buildWho: MainPage(),
                        menuState: MenuOpen(menuWidth: 224, menuOpen: true),
                      ),
                    ),
                  )
              : null,
          label: const Text('Accedi', style: TextStyle(fontSize: 18)),
        );
      },
    );
  }
}
