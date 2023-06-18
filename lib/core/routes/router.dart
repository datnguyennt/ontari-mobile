import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../modules/activity/views/activity_screen.dart';
import '../../modules/auth/bloc/login_bloc/login_bloc.dart';
import '../../modules/auth/views/login_phone_number_screen.dart';
import '../../modules/auth/views/login_screen.dart';
import '../../modules/auth/views/register_screen.dart';
import '../../modules/category/views/category_screen.dart';
import '../../modules/core/views/dashboard.screen.dart';
import '../../modules/core/views/splash_screen.dart';
import '../../modules/home/views/home_screen.dart';
import '../../modules/setting/views/setting_screen.dart';

part 'router.gr.dart';

class Routes {
  static const splash = '/';
  static const login = '/login';
  static const home = 'home';
  static const register = '/register';
  static const loginInPhone = '/log_in_phone';
  static const dashboard = '/dashboard';
  static const category = 'category';
  static const activity = 'activity';
  static const setting = 'setting';

  //Profile
  static const profile = 'profile';
}

@lazySingleton
@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashRoute.page, initial: true, path: Routes.splash),
    AutoRoute(page: LoginRoute.page, path: Routes.splash),
    AutoRoute(page: RegisterRoute.page, path: Routes.register),
    AutoRoute(
      path: Routes.dashboard,
      page: DashBoardRoute.page,
      children: [
    AutoRoute(page: HomeRoute.page, path: Routes.home),
        AutoRoute(path: Routes.activity, page: ActivityRoute.page),
        AutoRoute(path: Routes.category, page: CategoryRoute.page),
        AutoRoute(path: Routes.setting, page: SettingRoute.page),
      ],
    ),
    AutoRoute(page: LogInPhoneNumberRoute.page, path: Routes.loginInPhone),
  ];
}
