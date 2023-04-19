
// ignore_for_file: inference_failure_on_function_invocation

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/data/repository/user.repository.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';

class AuthController extends GetxController {

  AuthController(this.repository);
  final UserRepository repository;

  static AuthController get to => Get.find<AuthController>();

  //
  final Rx<User?> _loggedUser = FirebaseAuth.instance.currentUser.obs;
  User? get loggedUser => _loggedUser.value;
  Future<void> createUserByEmail({
    required String email,
    required String password,
  }) async {
    final result = await repository.signUpWithEmail(
      email: email,
      password: password,
    );
    await result.fold(
      (error) {
        throw Exception(error);
      },
      (user) async {
        final user = FirebaseAuth.instance.currentUser;
        if (user == null) {
          return;
        }
        // await setLoggedUser(user);
        await handleNavigateHome();
      },
    );
  }

  Future<void> loginByEmail({
    required String email,
    required String password,
  }) async {
    final result = await repository.signInWithEmail(
      email: email,
      password: password,
    );
    result.fold(
      (error) {
        throw Exception(error);
      },
      (user) async {
        await setLoggedUser(user);
        await handleNavigateHome();
      },
    );
  }

  Future<void> logout() async {
    await repository.logout();
  }

  Future<void> verifyUser() async {
    if (loggedUser == null) {
      await Get.offAllNamed(Routes.LOGIN);
    }
  }

  Future<void> setLoggedUser(User user) async {
    _loggedUser.value = user;
  }

  Future<void> handleNavigateHome() async {
    Get.offAllNamed(Routes.HOME);
  }
}
