import 'package:get/get.dart';
import 'package:ontari_mobile/app/data/repository/user.repository.dart';
import 'package:ontari_mobile/app/di/injection.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/auth.controller.dart';
import 'package:ontari_mobile/app/modules/base/controller/base.controller.dart';

class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get..put<BaseController>(
      BaseController(),
      permanent: true,
    )
    ..put<AuthController>(
      AuthController(getIt.get<UserRepository>()),
      permanent: true,
    );
  }
}
