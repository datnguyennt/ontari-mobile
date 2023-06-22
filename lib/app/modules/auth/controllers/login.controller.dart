import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../core/common/validators/form.validate.dart';
import '../../../core/common/validators/login_validate.index.dart';
import '../../../core/common/validators/phone_number.validate.dart';
import '../../../data/models/user.model.dart';
import '../../../data/remote/dto/user_credential.dto.dart';
import '../../../data/remote/repository/user.repository.dart';
import '../../../services/auth.service.dart';

class LoginControler extends BaseController {
  LoginControler({
    required this.userRepository,
  });
  final UserRepository userRepository;
  FormzSubmissionStatus formStatus = FormzSubmissionStatus.initial;
  EmailValidateModel emailValidate = const EmailValidateModel.pure();
  PasswordValidateModel passwordValidate = const PasswordValidateModel.pure();
  PhoneNumberValidateModel phoneNumberValidate =
      const PhoneNumberValidateModel.pure();
  bool showPassword = false;

  final AuthService _authService = Get.find();

  void onEmailChanged(String email) {
    emailValidate = EmailValidateModel.dirty(email);
    update(['email']);
  }

  void onPasswordChanged(String password) {
    passwordValidate = PasswordValidateModel.dirty(password);
    update(['password']);
  }

  void onPhoneBumberChanged(String phone) {
    phoneNumberValidate = PhoneNumberValidateModel.dirty(phone);
    update(['phone']);
  }

  void onTonglePassword() {
    showPassword = !showPassword;
    update(['password']);
  }

  Future<void> onLogin() async{
    final bool valid = Formz.validate([emailValidate, passwordValidate]);
    if (!valid) {
      return;
    }
    final userDto = UserCreadentialDto(
      email: emailValidate.value,
      password: passwordValidate.value,
    );

    final future = userRepository.signInWithEmail(userDto);

    callDataService(
      future,
      onSuccess: _onSuccess,
      onError: (exception) {
        logE(errorMessage);
      },
    );
  }

  void _onSuccess(UserModel user) {
    _authService.setUser(user);
  }
}
