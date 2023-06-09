import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/core/bloc/state.dart';

class LoginBloc extends BaseBloc {
  LoginBloc() : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    // if (event is LoginUsernameChanged) {
    //   userName = event.username;
    // } else if (event is LoginPasswordChanged) {
    //   password = event.password;
    // } else if (event is LoginSubmitted) {
    //   await safeDataCall(
    //     emit,
    //     callToHost:
    //         _loginRepository.performLogin(LoginRequest("0987654321", "123456")),
    //     success: (Emitter<BaseState> emit, LoginResponse? data) {
    //       Fimber.e("login success data - ${data?.token}");
    //       hideDialogState();
    //       token = data?.token ?? "";
    //       navigationService.pushAndRemoveUntil(
    //         const HomeScreenRoute(),
    //         predicate: (route) => false,
    //       );
    //     },
    //   );
    // }
  }
}
