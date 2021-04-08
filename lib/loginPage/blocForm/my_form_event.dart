part of 'my_form_bloc.dart';

abstract class MyFormEvent extends Equatable {
  const MyFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends MyFormEvent {
  const EmailChanged({this.email});

  final String email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends MyFormEvent {}

class PasswordChanged extends MyFormEvent {
  const PasswordChanged({this.password, this.page});

  final String password;
  final bool page;

  @override
  List<Object> get props => [password];
}

class PasswordUnfocused extends MyFormEvent {}

class UsernameChanged extends MyFormEvent {
  const UsernameChanged({this.username});

  final String username;

  @override
  List<Object> get props => [username];
}

class UsernameUnfocused extends MyFormEvent {}

class FormSubmitted extends MyFormEvent {}
