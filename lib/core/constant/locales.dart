import 'package:flutter/material.dart';

class AppLocales {
  static const Locale en = Locale('en', 'US');
  static const Locale vi = Locale('vi', 'VN');
  static const List<Locale> supportedLocales = [en, vi];
  static const String path = 'assets/locales';
  static const String defaultLocale = 'en';
}
