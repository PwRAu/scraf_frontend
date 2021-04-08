import 'package:formz/formz.dart';

enum UsernameValidationError { invalid }

class Username extends FormzInput<String, UsernameValidationError> {
  const Username.pure([String value = '']) : super.pure(value);
  const Username.dirty([String value = '']) : super.dirty(value);

  static final _passwordRegex = RegExp(r'[^\s]{3,20}$');

  @override
  UsernameValidationError validator(String value) {
    return _passwordRegex.hasMatch(value ?? '')
        ? null
        : UsernameValidationError.invalid;
  }
}
