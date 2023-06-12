import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/data/models/user.model.dart';

abstract class AuthEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AuthChanged extends AuthEvent {
  final UserModel? user;
  AuthChanged(this.user);
  @override
  List<Object?> get props => [user];
}

class AppLogoutRequested extends AuthEvent {
  AppLogoutRequested();
  @override
  List<Object?> get props => [];
}
