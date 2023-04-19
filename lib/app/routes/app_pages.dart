import 'package:get/get.dart';
import 'package:ontari_mobile/app/modules/auth/bindings/auth_binding.dart';
import 'package:ontari_mobile/app/modules/auth/views/login_view.dart';
import 'package:ontari_mobile/app/modules/auth/views/sign_up.view.dart';
import 'package:ontari_mobile/app/modules/base/binding/base.binding.dart';

import 'package:ontari_mobile/app/modules/home/home.export.dart';
import 'package:ontari_mobile/app/modules/onboarding/onboarding.export.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.ONBOARDING;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      bindings: [
        BaseBinding(),
        OnboardingBinding(),
      ],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => const SignUpView(),
      binding: AuthBinding(),
    ),
  ];
}
