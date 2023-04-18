import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/constants/assets.gen.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';

class OnboardingController extends GetxController {
  final count = 0.obs;
  List<OnboardingText> onboardings = [
    OnboardingText(
      title: 'Learn from Best',
      description:
          'Learn everything to improve your skills taught by the best mentors.',
      image: Assets.images.onboarding1.path,
    ),
    OnboardingText(
      title: 'Download Course',
      description:
          'Dont worry if you’re offline, download the video and enjoy the video. ',
      image: Assets.images.onboarding2.path,
    ),
    OnboardingText(
      title: 'Explore Courses',
      description:
          'Lets explore courses. In this application have 1000 courses and 200 mentors.',
      image: Assets.images.onboarding3.path,
    ),
  ];

  PageController pageController = PageController();
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
 
  void onPageChanged(int index) {
    _currentIndex = index;
    update();
  }
  void nextPage() {
    if (currentIndex == onboardings.length - 1) {
      Get.toNamed(Routes.login);
    }
    pageController.animateToPage(
      currentIndex + 1,
      duration: const Duration(milliseconds: 250),
      curve: Curves.ease,
    );
  }


  void increment() => count.value++;
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
