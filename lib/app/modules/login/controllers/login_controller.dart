import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final UserRepository repository;

  LoginController(this.repository);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool _showPassword = false.obs;
  bool get showPassword => _showPassword.value;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onChangeVisiblePassword() {
    _showPassword.value = !_showPassword.value;
  }
}
