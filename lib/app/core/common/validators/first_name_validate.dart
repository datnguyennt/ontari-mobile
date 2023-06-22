import '../enum/validator.enum.dart';
import 'form.validate.dart';

class FirstNameValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const FirstNameValidateModel.pure() : super.pure('');
  const FirstNameValidateModel.dirty([super.value = '']) : super.dirty();

  @override
  ValidationErrorEnum? validator(String value) {
    //First name empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    return null;
  }
}
