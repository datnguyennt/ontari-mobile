// import 'package:formz/formz.dart';
// import 'package:easy_localization/easy_localization.dart';

// enum FirstNameValidationError { empty }

// class FirstNameValidateModel
//     extends FormzInput<String, FirstNameValidationError> {
//   const FirstNameValidateModel.pure() : super.pure('');
//   const FirstNameValidateModel.dirty([super.value = '']) : super.dirty();

//   @override
//   FirstNameValidationError? validator(String value) {
//     //First name empty
//     if (value.isEmpty) return FirstNameValidationError.empty;

//     return null;
//   }
// }

// extension FirshNameValidate on FirstNameValidationError {
//   String get getTextValidate {
//     switch (this) {
//       case FirstNameValidationError.empty:
//         return LocaleKeys.validator_first_name_not_empty.tr();
//       default:
//         return '';
//     }
//   }
// }
