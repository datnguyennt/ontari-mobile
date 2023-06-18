part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginEmailChanged extends LoginEvent {
  const LoginEmailChanged(this.email);
  final String email;

  @override
  List<Object> get props => [email];
}

class LoginPasswordChanged extends LoginEvent {
  const LoginPasswordChanged(this.password);
  final String password;

  @override
  List<Object> get props => [password];
}

class LoginCreadentialSubmitted extends LoginEvent {
  const LoginCreadentialSubmitted({
    required this.email,
    required this.password,
  });
  final String email;
  final String password;

  @override
  List<Object> get props => [email, password];
}

class LoginWithPhoneSubmitted extends LoginEvent {
  const LoginWithPhoneSubmitted({
    required this.phoneNumber,
  });
  final String phoneNumber;

  @override
  List<Object> get props => [phoneNumber];
}

class LoginWithGoogleEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginWithFacebookEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class LoginWithAppleEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class TonglePasswordEvent extends LoginEvent {
  const TonglePasswordEvent();

  @override
  List<Object> get props => [];
}

class LoginPhoneChanged extends LoginEvent {
  const LoginPhoneChanged(this.phone);
  final String phone;

  @override
  List<Object> get props => [phone];
}
