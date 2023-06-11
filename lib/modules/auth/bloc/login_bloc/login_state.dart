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
  });

  final FormzSubmissionStatus formStatus;
  final LoginStatus loginStatus;
  final EmailValidateModel email;
  final PasswordValidateModel password;
  final String errorMessage;

  LoginState copyWith({
    LoginStatus? loginStatus,
    EmailValidateModel? email,
    PasswordValidateModel? password,
    bool? obscurePassword,
    String? errorMessage,
    FormzSubmissionStatus? formStatus,
  }) {
    return LoginState(
      loginStatus: loginStatus ?? this.loginStatus,
      email: email ?? this.email,
      formStatus: formStatus ?? this.formStatus,
      password: password ?? this.password,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        loginStatus,
        email,
        password,
        errorMessage,
        formStatus,
      ];
}
