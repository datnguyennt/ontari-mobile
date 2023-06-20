import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/core/constant/hive_keys.dart';
import 'package:ontari_mobile/core/constant/locales.dart';
import 'package:ontari_mobile/core/hive.helper.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/modules/core/blocs/app_bloc/app_event.dart';

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
    bool darkMode = !isDarkMode;
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
