import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_event.dart';

class AuthBloc extends BaseBloc {
  AuthBloc(super.state);

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is AuthChanged) {
    } else {}
  }
}
