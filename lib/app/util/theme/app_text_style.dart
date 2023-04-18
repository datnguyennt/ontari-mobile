import 'package:flutter/material.dart';

class TextStyles {
  TextStyles._();

  //Headline
  static TextStyle headline1(BuildContext context) =>
      Theme.of(context).textTheme.headlineLarge!;

  static TextStyle headline2(BuildContext context) =>
      Theme.of(context).textTheme.headlineMedium!;

  static TextStyle headline4(BuildContext context) =>
      Theme.of(context).textTheme.headlineSmall!;

  //Body
  static TextStyle bodyTextMedium(BuildContext context) =>
      Theme.of(context).textTheme.bodyMedium!;

  static TextStyle bodyTextSmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!;

//Button
  static TextStyle buttonTextSmall(BuildContext context) =>
      Theme.of(context).textTheme.bodySmall!.copyWith(
            height: 16.39 / 12,
            fontWeight: FontWeight.w600,
          );
}
