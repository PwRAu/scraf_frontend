import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:home/global/config.dart';
import 'package:home/loginPage/models/email.dart';
import 'package:home/loginPage/models/password.dart';
import 'package:home/loginPage/models/username.dart';

part 'my_form_event.dart';
part 'my_form_state.dart';

class MyFormBloc extends Bloc<MyFormEvent, MyFormState> {
  MyFormBloc() : super(const MyFormState());

  @override
  void onTransition(Transition<MyFormEvent, MyFormState> transition) {
    //print(transition);
    super.onTransition(transition);
  }

  @override
  Stream<MyFormState> mapEventToState(MyFormEvent event) async* {
    if (event is EmailChanged) {
      final email = Email.dirty(event.email);
      if (event.page) {
        yield state.copyWith(
          email: email.valid ? email : Email.pure(event.email),
          status: Formz.validate([email, state.password]),
        );
      } else {
        yield state.copyWith(
          email: email.valid ? email : Email.pure(event.email),
          status: Formz.validate([email, state.password, state.username]),
        );
      }
    } else if (event is PasswordChanged) {
      final password = Password.dirty(event.password);
      if (event.page) {
        yield state.copyWith(
          password: password.valid ? password : Password.pure(event.password),
          status: Formz.validate([state.email, password]),
        );
      } else {
        yield state.copyWith(
          password: password.valid ? password : Password.pure(event.password),
          status: Formz.validate([state.email, password, state.username]),
        );
      }
    } else if (event is UsernameChanged) {
      final username = Username.dirty(event.username);
      yield state.copyWith(
        username: username.valid ? username : Username.pure(event.username),
        status: Formz.validate([state.email, state.password, username]),
      );
    } else if (event is EmailUnfocused) {
      final email = Email.dirty(state.email.value);
      if (event.page) {
        yield state.copyWith(
          email: email,
          status: Formz.validate([email, state.password]),
        );
      } else {
        yield state.copyWith(
          email: email,
          status: Formz.validate([email, state.password, state.username]),
        );
      }
    } else if (event is PasswordUnfocused) {
      final password = Password.dirty(state.password.value);
      if (event.page) {
        yield state.copyWith(
          password: password,
          status: Formz.validate([state.email, password]),
        );
      } else {
        yield state.copyWith(
          password: password,
          status: Formz.validate([state.email, password, state.username]),
        );
      }
    } else if (event is UsernameUnfocused) {
      final username = Username.dirty(state.username.value);
      yield state.copyWith(
        username: username,
        status: Formz.validate([state.email, state.password, username]),
      );
    } else if (event is FormSubmitted) {
      final email = Email.dirty(state.email.value);
      final password = Password.dirty(state.password.value);
      //final username = Username.dirty(state.username.value);
      yield state.copyWith(
        email: email,
        password: password,
        //username: username,
        status: Formz.validate([email, password]),
      );
      if (state.status.isValidated) {
        yield state.copyWith(status: FormzStatus.submissionInProgress);
        await Future<void>.delayed(const Duration(seconds: 1));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      }
    }
  }
}
