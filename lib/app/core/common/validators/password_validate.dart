import '../enum/validator.enum.dart';
import 'form.validate.dart';

class PasswordValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const PasswordValidateModel.pure() : super.pure('');

  const PasswordValidateModel.dirty([super.value = '']) : super.dirty();

  // static final _passwordRegex =
  //     RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  ValidationErrorEnum? validator(String value) {
    //Password empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    if (value.length < 6) {
      return ValidationErrorEnum.tooshort;
    }

    //Password invalid
    // if (!_passwordRegex.hasMatch(value)) return PasswordValidationError.invalid;
    return null;
  }
}
