import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/base/base_bloc.dart';
import '../../../../core/base/event.dart';
import '../../../../core/base/state.dart';
import '../../../../core/constant/hive_keys.dart';
import '../../../../core/constant/locales.dart';
import '../../../../core/utils/hive.helper.dart';
import '../../../../di/di.dart';
import 'app_event.dart';

@singleton
class AppBloc extends BaseBloc {
  AppBloc() : super(const InitialState());
  bool isDarkMode = false;
  String currentLocale = AppLocales.en.languageCode;
  static AppBloc get to => getIt<AppBloc>();

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {
    await _handleInit(emit);
    return super.onInit(emit);
  }

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is AppThemeSwitchEvent) {
      await _onSwichTheme(emit);
    } else if (event is AppLanguageSwitchEvent) {
      await _onSwitchLanguage(emit);
    }
  }

  Future<void> _handleInit(Emitter<BaseState> emit) async {
    emit.call(LoadingDialogState());
    final bool isDarkTheme = await isDark();
    final String locale = await getCurrentLocale();
    isDarkMode = isDarkTheme;
    currentLocale = locale;
    emit.call(SuccessState([isDarkTheme, locale]));
  }

  Future<bool> isDark() async {
    final bool? isDarkMode = await HiveHelper.get(HiveKeys.isDarkMode);
    return isDarkMode ?? false;
  }

  Future<void> _onSwichTheme(Emitter<BaseState> emit) async {
    final bool darkMode = !isDarkMode;
    await HiveHelper.put(key: HiveKeys.isDarkMode, value: darkMode);
    isDarkMode = darkMode;
    emit.call(SuccessState(darkMode));
  }

  Future<String> getCurrentLocale() async {
    final String? locale = await HiveHelper.get(HiveKeys.locale);
    return locale ?? AppLocales.en.languageCode;
  }

  Future<void> _onSwitchLanguage(Emitter<BaseState> emit) async {
    Locale updateLocale;
    if (currentLocale == AppLocales.en.languageCode) {
      updateLocale = AppLocales.vi;
    } else {
      updateLocale = AppLocales.en;
    }
    await HiveHelper.put(
        key: HiveKeys.locale, value: updateLocale.languageCode);
    currentLocale = updateLocale.languageCode;
    emit.call(SuccessState(currentLocale));
  }
}
