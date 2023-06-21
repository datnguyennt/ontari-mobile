import 'package:easy_localization/easy_localization.dart';

import '../../../generated/locale_keys.g.dart';
import 'form_validator.dart';

class PhoneNumberValidateModel extends FormzInput<String, String> {
  const PhoneNumberValidateModel.pure() : super.pure('');

  const PhoneNumberValidateModel.dirty([super.value = '']) : super.dirty();

  static final _phoneRegrex =
      RegExp(r'^(0?)(3[2-9]|5[6|8|9]|7[0|6-9]|8[0-6|8|9]|9[0-4|6-9])[0-9]{7}$');

  @override
  String? validator(String value) {
    //Phone number empty
    if (value.isEmpty) {
      return LocaleKeys.validator_not_empty.tr(
        namedArgs: {
          'field': 'Phone number',
        },
      );
    }

    //Phone number invalid
    if (!_phoneRegrex.hasMatch(value)) {
      return LocaleKeys.validator_invalid.tr(
        namedArgs: {
          'field': 'Phone number',
        },
      );
    }
    return null;
  }
}
