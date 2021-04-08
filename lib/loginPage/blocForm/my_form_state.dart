part of 'my_form_bloc.dart';

class MyFormState extends Equatable {
  const MyFormState({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.username = const Username.pure(),
    this.status = FormzStatus.pure,
  });

  final Email email;
  final Password password;
  final Username username;
  final FormzStatus status;

  MyFormState copyWith({
    Email email,
    Password password,
    Username username,
    FormzStatus status,
  }) {
    return MyFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      username: username ?? this.username,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [email, password, username, status];
}
