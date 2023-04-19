import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/data/repository/user.repository.dart';

class LoginController extends GetxController {
  LoginController(this.repository);

  final UserRepository repository;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final RxBool _showPassword = false.obs;

  bool get showPassword => _showPassword.value;

  Future<void> signInCredential() async {
    final response = await repository.signInCredential(
      email: 'email',
      password: 'password',
    );
    debugPrint('$response');
  }

  void onChangeVisiblePassword() {
    _showPassword.value = !_showPassword.value;
  }
}
