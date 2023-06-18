import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/bloc/base_bloc.dart';
import '../../../../core/bloc/event.dart';
import '../../../../core/bloc/state.dart';
import '../../../../core/constant/hive_keys.dart';
import '../../../../core/hive.helper.dart';
import 'theme_event.dart';

@singleton
class ThemeBloc extends BaseBloc {
  ThemeBloc() : super(const InitialState());
  bool isDarkMode = false;

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is InitialEvent) {
      await _handleInit(emit);
    }

    if (event is ThemeSwitchedEvent) {
      await _onSwichTheme(emit);
    }
  }

  Future<void> _handleInit(Emitter<BaseState> emit) async {
    final bool isDarkTheme = await isDark();
    emit.call(SuccessState(isDarkTheme));
    isDarkMode = isDarkTheme;
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
}
