import 'package:get/get.dart';
import 'package:ontari_mobile/app/modules/base/controllers/base.controller.dart';


class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BaseController>(
      BaseController(),
      permanent: true,
    );
    // Get.put<AuthController>(
    //   AuthController(getIt.get<UserRepository>()),
    //   permanent: true,
    // );
  }
}
