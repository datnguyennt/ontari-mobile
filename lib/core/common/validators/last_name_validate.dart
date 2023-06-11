// import 'package:formz/formz.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:elearning_marketplace/generated/locale_keys.g.dart';

// enum LastNameValidationError { empty }

// class LastNameValidateModel
//     extends FormzInput<String, LastNameValidationError> {
//   const LastNameValidateModel.pure() : super.pure('');
//   const LastNameValidateModel.dirty([super.value = '']) : super.dirty();

//   @override
//   LastNameValidationError? validator(String value) {
//     //Last name empty
//     if (value.isEmpty) return LastNameValidationError.empty;

//     return null;
//   }
// }

// extension UserNameValidate on LastNameValidationError {
//   String get getTextValidate {
//     switch (this) {
//       case LastNameValidationError.empty:
//         return LocaleKeys.validator_last_name_not_empty.tr();
//       default:
//         return '';
//     }
//   }
// }
