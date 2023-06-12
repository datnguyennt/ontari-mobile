import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/core/constant/hive_keys.dart';
import 'package:ontari_mobile/core/hive.helper.dart';
import 'package:ontari_mobile/modules/core/blocs/theme_bloc/theme_event.dart';

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
    bool darkMode = !isDarkMode;
    await HiveHelper.put(key: HiveKeys.isDarkMode, value: darkMode);
    isDarkMode = darkMode;
    emit.call(SuccessState(darkMode));
  }
}
