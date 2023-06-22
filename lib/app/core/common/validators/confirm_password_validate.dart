import '../enum/validator.enum.dart';
import 'form.validate.dart';

class ConfirmPassewordValidateModel
    extends FormzInput<String, ValidationErrorEnum> {
  const ConfirmPassewordValidateModel.pure({this.password = ''})
      : super.pure('');
  const ConfirmPassewordValidateModel.dirty([
    super.value = '',
    this.password = '',
  ]) : super.dirty();
  final String password;

  @override
  ValidationErrorEnum? validator(String value) {
    if (value.isEmpty) return ValidationErrorEnum.required;
    if (value != password) return ValidationErrorEnum.notMatch;
    return null;
  }
}
