import 'package:flutter/material.dart';
import 'package:ontari_mobile/app/enums/language.enum.dart';

const List<Locale> supportedLocales = [
  Locale(LanguageEnum.english, ''),
  Locale(LanguageEnum.vi, ''),
];

const Locale fallbackLocale = Locale(LanguageEnum.english, '');
