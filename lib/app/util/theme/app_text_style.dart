import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  //Headline
  static headline1(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge;

  static headline2(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium;

  static headline4(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall;

  //Body
  static TextStyle bodyTextMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;

  static bodyTextSmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall;

//Button
  static buttonTextSmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            height: 16.39 / 12,
            fontWeight: FontWeight.w600,
          );
}
