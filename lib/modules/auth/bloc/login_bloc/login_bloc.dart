import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/common/validators/form_validator.dart';
import '../../../../core/common/validators/login_validate.index.dart';
import '../../../../core/common/validators/phone_number.validate.dart';
import '../../../../data/remote/dto/user_credential.dto.dart';
import '../../../../data/remote/repository/user.repository.dart';
import '../auth_bloc/auth_bloc.dart';
import '../auth_bloc/auth_event.dart';

part 'login_event.dart';
part 'login_state.dart';

@injectable
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required this.userRepository,
  }) : super(const LoginState()) {
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<TonglePasswordEvent>(_onTongledPassword);
    on<LoginPhoneChanged>(_onPhoneNumerChanged);

    //
    on<LoginCreadentialSubmitted>(_onLoginCreadentialSubmitted);
    on<LoginWithPhoneSubmitted>(_onLoginWithPhoneSubmitted);
    //
  }
  final UserRepository userRepository;
  final AuthBloc authBloc = AuthBloc.to;

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

  void _onPhoneNumerChanged(
    LoginPhoneChanged event,
    Emitter<LoginState> emit,
  ) {
    final phoneModel = PhoneNumberValidateModel.dirty(event.phone);
    emit(
      state.copyWith(
        phoneNumber: phoneModel,
        formStatus: Formz.validate([phoneModel])
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

  Future<void> _onLoginCreadentialSubmitted(
    LoginCreadentialSubmitted event,
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

  Future<void> _onLoginWithPhoneSubmitted(
    LoginWithPhoneSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    final phoneModel = PhoneNumberValidateModel.dirty(event.phoneNumber);

    if (!Formz.validate([phoneModel, state.phoneNumber])) {
      emit(
        state.copyWith(
          phoneNumber: phoneModel,
          formStatus: FormzSubmissionStatus.failure,
          loginStatus: LoginStatus.validating,
        ),
      );
      return;
    }
    emit(state.copyWith(loginStatus: LoginStatus.inProgress));

    try {
      final response =
          await userRepository.signInWithPhoneNumber(event.phoneNumber);
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
