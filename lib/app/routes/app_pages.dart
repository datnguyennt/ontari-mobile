import 'package:flutter_clean_architech_bloc/app/modules/base/bindings/base.binging.dart';
import 'package:get/get.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.onboarding;

  static final routes = [
    GetPage(
      name: Routes.onboarding,
      page: () => const OnboardingView(),
      bindings: [BaseBinding(), OnboardingBinding()],
      transition: Transition.noTransition,
    ),
    GetPage(
      name: Routes.home,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
  ];
}
