import 'package:flutter_clean_architech_bloc/app/modules/base/controllers/base.controller.dart';
import 'package:get/get.dart';


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
