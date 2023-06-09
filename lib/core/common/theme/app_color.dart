import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  //light Theme
  static const kPrimaryLight = Color(0xff121F3E);
  static const kDotLight = Color(0xffE5EBF0);
  static const kSecondaryLight = Color(0xff003074);

//Dark Theme
  static const kPrimaryDark = Color(0xff356AD1);
  static const kSecondaryDark = Color(0xff21273B);

//Comon theme
  static const kYellow = Color(0xffFBBC05);
  static const kGrey = Color(0xff96A0B5);
  static const kRed = Color(0xffFD2A2A);
  static const kGrey2 = Color(0xffB6BEC9);
  static const kGreen = Color(0xff00BF71);
  static const kDotUnselected = Color(0xffE5EBF0);
  static const kWhite = Colors.white;
  static const kLightBlue = Color(0xffECF3FA);
  static const kBorderColor = Color(0xffC3C4C5);
  static const kGrey600 = Color(0xff697896);
  static const kGrey700 = Color(0xff697896);

  static const MaterialColor kprimary =
      MaterialColor(_kprimaryPrimaryValue, <int, Color>{
    50: Color(0xFFEBEEFA),
    100: Color(0xFFDEE6F8),
    200: Color(0xFFC9D7F3),
    300: Color(0xFFA4BCEA),
    400: Color(0xFF7A9DE1),
    500: Color(_kprimaryPrimaryValue),
    600: Color(0xFF356AD1),
    700: Color(0xFF2C5EBF),
    800: Color(0xFF003F99),
    900: Color(0xFF003074),
  });
  static const int _kprimaryPrimaryValue = 0xFF5984D9;

  static const MaterialColor kprimaryAccent =
      MaterialColor(_kprimaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_kprimaryAccentValue),
    400: Color(0xFF9DB5FF),
    700: Color(0xFF84A2FF),
  });
  static const int _kprimaryAccentValue = 0xFFD0DCFF;

  static const MaterialColor kGreyscale =
      MaterialColor(_kGreyPrimaryValue, <int, Color>{
    50: Color(0xFFF0F5F9),
    100: Color(0xFFF3F7F9),
    200: Color(0xFFE8EAEE),
    300: Color(0xFFD0D5DC),
    400: Color(0xFFB6BEC9),
    500: Color(_kGreyPrimaryValue),
    600: Color(0xFF697896),
    700: Color(0xFF121F3E),
    800: Color(0xFF21273B),
    900: Color(0xFF191D2B),
  });
  static const int _kGreyPrimaryValue = 0xFF96A0B5;

  static const MaterialColor kgreyAccent =
      MaterialColor(_kGreyAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_kGreyAccentValue),
    400: Color(0xFF9EBBFF),
    700: Color(0xFF85A9FF),
  });
  static const int _kGreyAccentValue = 0xFFD1DFFF;
}
