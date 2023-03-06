import 'package:flutter/material.dart';
import 'package:flutter_clean_architech_bloc/app/enums/language.enum.dart';

const List<Locale> supportedLocales = [
  Locale(LanguageEnum.english, ''),
  Locale(LanguageEnum.vi, ''),
];

const Locale fallbackLocale = Locale(LanguageEnum.english, '');
