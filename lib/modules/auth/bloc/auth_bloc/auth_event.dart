import 'package:firebase_auth/firebase_auth.dart';
import 'package:ontari_mobile/core/bloc/event.dart';

abstract class AuthEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AuthChanged extends AuthEvent {
  final User? user;
  AuthChanged(this.user);
  @override
  List<Object?> get props => [user];
}

class AppLogoutRequested extends AuthEvent {
  AppLogoutRequested();
  @override
  List<Object?> get props => [];
}
