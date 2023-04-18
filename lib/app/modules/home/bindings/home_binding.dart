import 'package:get/get.dart';

import 'package:ontari_mobile/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      HomeController.new,
    );
  }
}
