import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/bloc/event.dart';
import '../../../../core/bloc/state.dart';
import '../../../../di/di.dart';
import 'auth_event.dart';

@singleton
class AuthBloc extends BaseBloc {
  AuthBloc() : super(const InitialState());

  static AuthBloc get to => getIt<AuthBloc>();

  Future<void> _onAuthChanged(Emitter<BaseState> emit) async {
    emit.call(LoadingViewState());
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      await Future.delayed(const Duration(milliseconds: 200));
      if (user == null) {
        emit.call(ErrorViewState());
      } else {
        emit.call(SuccessState(user));
      }
    } catch (e) {
      emit.call(ErrorViewState());
    }
  }

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {
    await _onAuthChanged(emit);
    return super.onInit(emit);
  }

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is AuthChanged) {
      emit.call(SuccessState(event.user));
    } else if (event is AppLogoutRequested) {
      await FirebaseAuth.instance.signOut();
      emit.call(ErrorViewState(message: 'User logged out'));
    }
  }
}
