// import 'package:easy_localization/easy_localization.dart';
// import 'package:elearning_marketplace/generated/locale_keys.g.dart';
// import 'package:formz/formz.dart';

// enum PasswordValidationError { invalid, empty }

// class PasswordValidateModel
//     extends FormzInput<String, PasswordValidationError> {
//   const PasswordValidateModel.pure() : super.pure('');

//   const PasswordValidateModel.dirty([super.value = '']) : super.dirty();

//   static final _passwordRegex =
//       RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

//   @override
//   PasswordValidationError? validator(String value) {
//     //Password empty
//     if (value.isEmpty) return PasswordValidationError.empty;

//     //Password invalid
//     if (!_passwordRegex.hasMatch(value)) return PasswordValidationError.invalid;
//     return null;
//   }
// }

// extension PasswordValidate on PasswordValidationError {
//   String get getTextValidate {
//     switch (this) {
//       case PasswordValidationError.empty:
//         return LocaleKeys.validator_password_required.tr();
//       case PasswordValidationError.invalid:
//         return LocaleKeys.validator_password_include.tr();
//       default:
//         return '';
//     }
//   }
// }
