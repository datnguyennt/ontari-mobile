// import 'package:formz/formz.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:elearning_marketplace/generated/locale_keys.g.dart';

// enum PhoneNumberValidationError { empty }

// class PhoneNumberValidateModel  extends FormzInput<String, PhoneNumberValidationError> {
//   const PhoneNumberValidateModel.pure() : super.pure('');
//   const PhoneNumberValidateModel.dirty([super.value = '']) : super.dirty();

//   @override
//   PhoneNumberValidationError? validator(String value) {
//     //Phone number empty
//     if (value.isEmpty) return PhoneNumberValidationError.empty;

//     return null;
//   }
// }

// extension FirshNameValidate on PhoneNumberValidationError {
//   String get getTextValidate {
//     switch (this) {
//       case PhoneNumberValidationError.empty:
//         return LocaleKeys.validator_phone_number_not_empty.tr();
//       default:
//         return '';
//     }
//   }
// }
