import 'package:easy_localization/easy_localization.dart';
import 'package:ontari_mobile/core/common/validators/form_validator.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';

enum EmailValidationError { invalid, empty }

class EmailValidateModel extends FormzInput<String, String?> {
  const EmailValidateModel.pure() : super.pure('');
  const EmailValidateModel.dirty([super.value = '']) : super.dirty();

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  String? validator(String value) {
    //Email empty
    if (value.isEmpty) {
      return LocaleKeys.validator_not_empty.tr(
        namedArgs: {'field': 'Email'},
      );
    }

    //Email invalid
    if (!_emailRegExp.hasMatch(value)) {
      return LocaleKeys.validator_invalid.tr(
        namedArgs: {
          'field': 'Email',
        },
      );
    }

    return null;
  }
}
