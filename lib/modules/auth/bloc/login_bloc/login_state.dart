part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  success,
  failure,
  inProgress,
  validating,
  appleInProgressing,
  googleInProgressing,
  facebookInProgressing,
}

class LoginState extends Equatable {
  const LoginState({
    this.loginStatus = LoginStatus.initial,
    this.email = const EmailValidateModel.pure(),
    this.password = const PasswordValidateModel.pure(),
    this.errorMessage = '',
    this.formStatus = FormzSubmissionStatus.initial,
    this.showPassword = false,
    this.phoneNumber = const PhoneNumberValidateModel.pure(),
  });

  final FormzSubmissionStatus formStatus;
  final LoginStatus loginStatus;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final PhoneNumberValidateModel phoneNumber;
  final String errorMessage;
  final bool showPassword;

  LoginState copyWith({
    LoginStatus? loginStatus,
    EmailValidateModel? email,
    PasswordValidateModel? password,
    PhoneNumberValidateModel? phoneNumber,
    bool? showPassword,
    String? errorMessage,
    FormzSubmissionStatus? formStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
      showPassword: showPassword ?? this.showPassword,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  @override
  List<Object> get props => [
        loginStatus,
        email,
        password,
        errorMessage,
        formStatus,
        showPassword,
        phoneNumber,
      ];
}
