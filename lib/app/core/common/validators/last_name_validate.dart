import '../enum/validator.enum.dart';
import 'form.validate.dart';

class LastNameValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const LastNameValidateModel.pure() : super.pure('');
  const LastNameValidateModel.dirty([super.value = '']) : super.dirty();

  @override
  ValidationErrorEnum? validator(String value) {
    //Last name empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    return null;
  }
}
