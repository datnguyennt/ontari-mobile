import 'package:formz/formz.dart';

enum PasswordInputError {
  tooShort,
  noDigit,
  noUppercase,
}

class PasswordInput extends FormzInput<String, PasswordInputError> {
  const PasswordInput.dirty(super.value) : super.dirty();

  @override
  PasswordInputError? validator(String value) {
    if (value.length < 8) {
      return PasswordInputError.tooShort;
    }

    if (!value.contains(RegExp('A-Z'))) {
      return PasswordInputError.noUppercase;
    }

    return null;
  }
}
