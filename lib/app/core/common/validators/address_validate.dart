import '../enum/validator.enum.dart';
import 'form.validate.dart';

class AddressValidateModel extends FormzInput<String, ValidationErrorEnum> {
  const AddressValidateModel.pure() : super.pure('');
  const AddressValidateModel.dirty([super.value = '']) : super.dirty();

  @override
  ValidationErrorEnum? validator(String value) {
    //Address empty
    if (value.isEmpty) {
      return ValidationErrorEnum.required;
    }

    return null;
  }
}
