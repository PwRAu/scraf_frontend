import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home/global/config.dart';
import 'package:home/webApp/applicationMainPages/mainPage.dart';
import 'package:home/webApp/blocMenu/menu_bloc.dart';
import 'package:home/httpRequest/httpRequest.dart';
import 'package:formz/formz.dart';
import 'package:flutter/material.dart';
import 'package:home/webApp/index.dart';

import '../global/config.dart';
import 'blocForm/my_form_bloc.dart';
import 'loginform.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({Key key, this.focusNode, this.page}) : super(key: key);

  final FocusNode focusNode;
  final bool page;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        //context.read<MyFormBloc>().add(EmailChanged(email: email.text));
        return TextFormField(
          //initialValue: state.email.value,
          controller: email,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.email),
            labelText: 'Email',
            helperText: 'Email valida, es: pwrau@pwrau.it',
            errorText: state.email.invalid
                ? 'Controlla di aver inserito una email nel formato corretto'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context
                .read<MyFormBloc>()
                .add(EmailChanged(email: value, page: page));
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
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return TextFormField(
          //initialValue: state.email.value,
          controller: username,
          focusNode: focusNode,
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            labelText: 'Username',
            helperMaxLines: 2,
            helperText:
                'Inserire un nome utente con numero di caratteri compreso tra 3 e 20, senza spazi',
            errorMaxLines: 2,
            errorText: state.username.invalid
                ? 'Controlla che il nome utente abbia la lugnhezza richesta e che non contenga spazi'
                : null,
          ),

          keyboardType: TextInputType.name,
          onChanged: (value) {
            context.read<MyFormBloc>().add(UsernameChanged(username: value));
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({Key key, this.focusNode, this.page}) : super(key: key);

  final FocusNode focusNode;
  final bool page;

  @override
  Widget build(BuildContext context) {
    //print(page);
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        /*
        page == false && password.text.isEmpty
            ? context
                .read<MyFormBloc>()
                .add(PasswordChanged(password: password.text, page: page))
            : null;
        */
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
            context
                .read<MyFormBloc>()
                .add(PasswordChanged(password: value, page: page));
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
              ? () async {
                  await httpGetId().then((value) {
                    httpGetSubj(context);
                  });

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
                }
              : null,
          label: const Text('Accedi', style: TextStyle(fontSize: 18)),
        );
      },
    );
  }
}

class RegButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return ElevatedButton.icon(
          icon: Icon(Icons.app_registration, size: 18),
          onPressed:
              state.status.isValidated ? () => httpRegScraf(context) : null,
          label: const Text('Registrati', style: TextStyle(fontSize: 18)),
        );
      },
    );
  }
}
