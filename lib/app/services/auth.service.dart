import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../core/constant/hive_keys.dart';
import '../core/utils/hive.helper.dart';
import '../data/models/user.model.dart';
import '../routes/app_pages.dart';

class AuthService extends GetxService {
  static AuthService get to => Get.find();

  final Rxn<UserModel> _currentUser = Rxn<UserModel>();

  UserModel? get currentUser => _currentUser.value;

  bool get isLoggedInValue => currentUser != null;

  Future<void> onAuthChanged() async {
    try {
      final data = await HiveHelper.get(HiveKeys.user);
      if (data == null) {
        await logout();
      }
      final UserModel user = UserModel.fromJson(data);
      await Future.delayed(const Duration(milliseconds: 200));
      await setUser(user);
    } catch (e) {
      _currentUser.value = null;
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      _currentUser.value = null;
      await Get.offAllNamed(Routes.login);
    } catch (e) {}
  }

  Future<void> setUser(UserModel user) async {
    _currentUser.value = user;
    await HiveHelper.put(key: HiveKeys.user, value: user.toJson());
  }
}
