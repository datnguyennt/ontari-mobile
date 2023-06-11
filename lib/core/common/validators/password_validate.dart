import 'package:easy_localization/easy_localization.dart';
import 'package:ontari_mobile/core/common/validators/form_validator.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';

enum PasswordValidationError { invalid, empty }

class PasswordValidateModel extends FormzInput<String, String?> {
  const PasswordValidateModel.pure() : super.pure('');

  const PasswordValidateModel.dirty([super.value = '']) : super.dirty();

  static final _passwordRegex =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

  @override
  String? validator(String value) {
    //Password empty
    if (value.isEmpty) {
      return LocaleKeys.validator_not_empty.tr(
        namedArgs: {'field': 'Password'},
      );
    }

    if (value.length < 6) {
      return 'Password too short';
    }

    //Password invalid
    // if (!_passwordRegex.hasMatch(value)) return PasswordValidationError.invalid;
    return null;
  }
}
