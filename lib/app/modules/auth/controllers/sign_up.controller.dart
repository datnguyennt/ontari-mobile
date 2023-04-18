// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/constants/countries.dart';
import 'package:ontari_mobile/app/data/models/country.model.dart';
import 'package:ontari_mobile/app/data/repository/user.repository.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/auth.controller.dart';
import 'package:ontari_mobile/app/util/logger/common_logger.util.dart';
import 'package:ontari_mobile/app/util/snack_bar.widget.dart';

class SignUpController extends GetxController {

  SignUpController(this.repository);
  final UserRepository repository;

  static SignUpController get to => Get.find<SignUpController>();

  final AuthController _authController = AuthController.to;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final Rx<CountryModel> _selectedCountry = commonCountry.first.obs;
  CountryModel get selectedCountry => _selectedCountry.value;

  final RxBool _showPassword = false.obs;
  bool get showPassword => _showPassword.value;

  final RxBool _checked = false.obs;
  bool get checked => _checked.value;

  String get fullPhoneNumber {
    if (phoneController.text.trim().contains('+')) {
      return phoneController.text.trim();
    } else {
      return '(${selectedCountry.phoneCode}) ${phoneController.text.trim()}';
    }
  }

  final List<TextEditingController> ditgitControllers =
      List.generate(6, (index) => TextEditingController()).toList();

  String get otp =>
      ditgitControllers.map((e) => e.text).join();

  final RxBool _isProcessing = false.obs;
  bool get isProcessing => _isProcessing.value;

  void onChangeVisiblePassword() {
    _showPassword.value = !_showPassword.value;
  }

  void setSelectedCountry(CountryModel country) {
    _selectedCountry.value = country;
  }

  void updateChecked() {
    _checked.value = !_checked.value;
  }

  Future<void> createUserByEmail() async {
    try {
      if (isProcessing) return;
      _isProcessing.value = true;

      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      //
      await _authController.createUserByEmail(email: email, password: password);
      //

    } catch (e) {
      CommonLog.error(e.toString());
      MessageToast.showErrorToast(e.toString());
    } finally {
      _isProcessing.value = false;
    }
  }
}
