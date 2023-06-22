import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';

enum ValidationErrorEnum { invalid, tooshort, required, notMatch }

extension ValidateExtension on ValidationErrorEnum? {
  String getTextValidate(String field) {
    switch (this) {
      case ValidationErrorEnum.required:
        return LocaleKeys.validator_required.trParams({'field': field});
      case ValidationErrorEnum.invalid:
        return LocaleKeys.validator_invalid.trParams({'field': field});
      case ValidationErrorEnum.tooshort:
        return LocaleKeys.validator_too_short.trParams({'field': field});
      case ValidationErrorEnum.notMatch:
        return LocaleKeys.validator_not_match.trParams({'field': field});
      default:
        return '';
    }
  }
}
