import 'package:get/get.dart';

import '../core/middleware/auth.middleware.dart';
import '../modules/core/bindings/core_binding.dart';
import '../modules/core/views/core_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: '/',
      page: () => const RootView(),
      bindings: [RootBinding()],
      participatesInRootNavigator: true,
      preventDuplicates: true,
      children: [
        GetPage(
          middlewares: [
            //only enter this route when not authed
            EnsureNotAuthedMiddleware(),
          ],
          name: _Paths.login,
          page: () => const LoginView(),
          bindings: [LoginBinding()],
        ),
        GetPage(
          preventDuplicates: true,
          name: _Paths.home,
          page: () => const HomeView(),
          bindings: [
            HomeBinding(),
          ],
          title: null,
          children: [
            GetPage(
              name: _Paths.dashboard,
              page: () => const DashboardView(),
              bindings: [
                DashboardBinding(),
              ],
            ),
            GetPage(
              middlewares: [
                //only enter this route when authed
                EnsureAuthMiddleware(),
              ],
              name: _Paths.profile,
              page: () => const ProfileView(),
              title: 'Profile',
              transition: Transition.size,
              bindings: [ProfileBinding()],
            ),
            GetPage(
              name: _Paths.products,
              page: () => const ProductsView(),
              title: 'Products',
              transition: Transition.cupertino,
              showCupertinoParallax: true,
              participatesInRootNavigator: false,
              bindings: [ProductsBinding(), ProductDetailsBinding()],
              children: [
                GetPage(
                  name: _Paths.productDetails,
                  transition: Transition.cupertino,
                  showCupertinoParallax: true,
                  page: () => const ProductDetailsView(),
                  bindings: const [],
                  middlewares: [
                    //only enter this route when authed
                    EnsureAuthMiddleware(),
                  ],
                ),
              ],
            ),
          ],
        ),
        GetPage(
          name: _Paths.settings,
          page: () => const SettingsView(),
          bindings: [
            SettingsBinding(),
          ],
        ),
      ],
    ),
    GetPage(
      name: _Paths.CORE,
      page: () => const CoreView(),
      binding: CoreBinding(),
    ),
  ];
}
