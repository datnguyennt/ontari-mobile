// import 'package:formz/formz.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:ontari_mobile/generated/locale_keys.g.dart';

// enum ConfirmPasswordValidationError { empty, notMatch }

// class ConfirmPassewordValidateModel
//     extends FormzInput<String, ConfirmPasswordValidationError> {
//   const ConfirmPassewordValidateModel.pure({this.password = ''})
//       : super.pure('');
//   const ConfirmPassewordValidateModel.dirty([super.value = '', this.password = ''])
//       : super.dirty();
//   final String password;

//   @override
//   ConfirmPasswordValidationError? validator(String value) {
//     if (value.isEmpty) return ConfirmPasswordValidationError.empty;
//     if (value != password) return ConfirmPasswordValidationError.notMatch;
//     return null;
//   }
// }

// extension ConfirmPasswordValidate on ConfirmPasswordValidationError {
//   String get getTextValidate {
//     switch (this) {
//       case ConfirmPasswordValidationError.empty:
//         return LocaleKeys.validator_cpassword_not_empty.tr();
//       case ConfirmPasswordValidationError.notMatch:
//         return LocaleKeys.validator_cpassword_not_match.tr();
//       default:
//         return '';
//     }
//   }
// }
