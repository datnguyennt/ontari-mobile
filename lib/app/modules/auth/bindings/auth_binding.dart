import 'package:get/get.dart';
import 'package:ontari_mobile/app/data/repository/user.repository.dart';
import 'package:ontari_mobile/app/di/injection.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/controller.export.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get..lazyPut<AuthController>(
      () => AuthController(getIt.get<UserRepository>()),
    )
    ..lazyPut<SignUpController>(
      () => SignUpController(getIt.get<UserRepository>()),
    )
     ..lazyPut<LoginController>(
      () => LoginController(getIt.get<UserRepository>()),
    );
  }
}
