import '../enum/validator.enum.dart';
import 'form.validate.dart';

class PhoneNumberValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const PhoneNumberValidateModel.pure() : super.pure('');
  const PhoneNumberValidateModel.dirty([super.value = '']) : super.dirty();

  @override
  ValidationErrorEnum? validator(String value) {
    //Phone number empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    return null;
  }
}
