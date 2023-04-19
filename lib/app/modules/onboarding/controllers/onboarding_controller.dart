// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_invocation

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/constants/app_assets.dart';
import 'package:ontari_mobile/app/modules/auth/controllers/auth.controller.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
    final AuthController _authController = AuthController.to;
  final count = 0.obs;
  List<OnboardingText> onboardings = [
    OnboardingText(
      title: 'Learn from Best',
      description:
          'Learn everything to improve your skills taught by the best mentors.',
      image: AppAssets.onboarding1,
    ),
    OnboardingText(
      title: 'Download Course',
      description:
          'Dont worry if you’re offline, download the video and enjoy the video. ',
      image: AppAssets.onboarding2,
    ),
    OnboardingText(
      title: 'Explore Courses',
      description:
          'Lets explore courses. In this application have 1000 courses and 200 mentors.',
      image: AppAssets.onboarding3,
    ),
  ];

  PageController pageController = PageController();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool get isEqualLengthList => currentIndex == onboardings.length - 1;

  void onPageChanged(int index) {
    _currentIndex = index;
    update();
  }

  void onTapButton() {
    if (isEqualLengthList) {
      Get.offAllNamed(Routes.LOGIN);
    }
    pageController.animateToPage(
      currentIndex + 1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }
  @override
  Future<void> onInit()async {
            await _authController.verifyUser();
    super.onInit();
  }
}

class OnboardingText {
  OnboardingText({
    required this.title,
    required this.description,
    required this.image,
  });
  final String title;
  final String description;
  final String image;
}
