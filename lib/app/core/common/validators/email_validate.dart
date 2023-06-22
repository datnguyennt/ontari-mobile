import '../enum/validator.enum.dart';
import 'form.validate.dart';

class EmailValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const EmailValidateModel.pure() : super.pure('');
  const EmailValidateModel.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  ValidationErrorEnum? validator(String value) {
    //Email empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    //Email invalid
    if (!_emailRegExp.hasMatch(value)) {
      return ValidationErrorEnum.invalid;
    }

    return null;
  }
}
