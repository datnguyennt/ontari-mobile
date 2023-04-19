import 'package:get/get.dart';

import 'package:ontari_mobile/app/modules/onboarding/controllers/onboarding_controller.dart';

class OnboardingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardingController>(
      OnBoardingController.new,
    );
  }
}
