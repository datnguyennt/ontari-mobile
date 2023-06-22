part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  static const home = _Paths.home;

  static const profile = _Paths.home + _Paths.profile;
  static const settings = _Paths.settings;

  static const products = _Paths.home + _Paths.products;

  static const login = _Paths.login;
  static const register = _Paths.register;
  static const dashboard = _Paths.home + _Paths.dashboard;
  Routes._();
  static String loginThen(String afterSuccessfulLogin) =>
      '$login?then=${Uri.encodeQueryComponent(afterSuccessfulLogin)}';
  static String productDetail(String productId) => '$products/$productId';
  static const CORE = _Paths.CORE;
}

abstract class _Paths {
  static const home = '/home';
  static const products = '/products';
  static const profile = '/profile';
  static const settings = '/settings';
  static const productDetails = '/:productId';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const CORE = '/core';
  static const register = '/eregister';
}
