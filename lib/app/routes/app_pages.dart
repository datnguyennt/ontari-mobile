import 'package:get/get.dart';
import 'package:ontari_mobile/app/modules/base/bindings/base.binging.dart';
import 'package:ontari_mobile/app/modules/login/bindings/login_binding.dart';
import 'package:ontari_mobile/app/modules/login/views/login_view.dart';
import 'package:ontari_mobile/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:ontari_mobile/app/modules/onboarding/views/onboarding_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const String initial = Routes.onboarding;

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
