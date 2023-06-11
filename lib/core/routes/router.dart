import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/modules/auth/views/login_screen.dart';
import 'package:ontari_mobile/modules/auth/views/register_screen.dart';
import 'package:ontari_mobile/modules/core/views/splash_screen.dart';
import 'package:ontari_mobile/modules/home/views/home_screen.dart';

part 'router.gr.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
}

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true, path: Routes.splash),
    AutoRoute(page: LoginRoute.page, path: Routes.splash),
    AutoRoute(page: HomeRoute.page, path: Routes.home),
    AutoRoute(page: RegisterRoute.page, path: Routes.register),
  ];
}
