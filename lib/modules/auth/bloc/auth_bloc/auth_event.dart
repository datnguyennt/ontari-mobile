import 'package:ontari_mobile/core/bloc/event.dart';

abstract class AuthEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AuthChanged extends AuthEvent {
  AuthChanged();
  @override
  List<Object?> get props => [];
}

class AppLogoutRequested extends AuthEvent {
  AppLogoutRequested();
  @override
  List<Object?> get props => [];
}
