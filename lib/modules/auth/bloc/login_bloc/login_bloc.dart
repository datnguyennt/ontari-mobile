import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/common/validators/form_validator.dart';
import 'package:ontari_mobile/core/common/validators/login_validate.index.dart';
import 'package:ontari_mobile/data/remote/dto/user_credential.dto.dart';
import 'package:ontari_mobile/data/remote/repository/user.repository.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_event.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.userRepository,
  }) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<TonglePasswordEvent>(_onTongledPassword);
    //
  }
  final UserRepository userRepository;

  void _onEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final emailModel = EmailValidateModel.dirty(event.email);
    emit(
      state.copyWith(
        email: emailModel,
        formStatus: Formz.validate([emailModel, state.email])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
        loginStatus: LoginStatus.validating,
      ),
    );
  }

  void _onPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final passwordModel = PasswordValidateModel.dirty(event.password);
    emit(
      state.copyWith(
        password: passwordModel,
        formStatus: Formz.validate([state.email, passwordModel])
            ? FormzSubmissionStatus.success
            : FormzSubmissionStatus.failure,
        loginStatus: LoginStatus.validating,
      ),
    );
  }

  void _onTongledPassword(
    TonglePasswordEvent event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copyWith(
        loginStatus: LoginStatus.validating,
        showPassword: !state.showPassword,
      ),
    );
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final emailModel = EmailValidateModel.dirty(event.email);
    final passwordModel = PasswordValidateModel.dirty(event.password);

    if (!Formz.validate([emailModel, state.email]) ||
        !Formz.validate([emailModel, passwordModel])) {
      emit(
        state.copyWith(
          email: emailModel,
          password: passwordModel,
          formStatus: FormzSubmissionStatus.failure,
          loginStatus: LoginStatus.validating,
        ),
      );
      return;
    }
    final AuthBloc authBloc = getIt<AuthBloc>();
    emit(state.copyWith(loginStatus: LoginStatus.inProgress));

    final userDto = UserCreadentialDto(
      email: event.email,
      password: event.password,
    );

    try {
      final response = await userRepository.signInWithEmail(userDto);
      response.fold((failure) {
        emit(
          state.copyWith(
            loginStatus: LoginStatus.failure,
            errorMessage: failure.message,
          ),
        );
      }, (authResponse) {
        authBloc.add(AuthChanged(authResponse));
        emit(state.copyWith(loginStatus: LoginStatus.success));
      });
    } catch (e) {
      emit(
        state.copyWith(
          loginStatus: LoginStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
