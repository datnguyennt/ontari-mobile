import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/core/common/exception/result.dart';
import 'package:ontari_mobile/core/constant/hive_keys.dart';
import 'package:ontari_mobile/core/hive.helper.dart';
import 'package:ontari_mobile/modules/core/blocs/bloc/theme_event.dart';

@singleton
class ThemeBloc extends BaseBloc {
  ThemeBloc() : super(const InitialState());

  @override
  Future<void> onInit(Emitter<BaseState> emit) async {
    await safeDataCall(
      emit,
      callToDb: isDark(),
      success: (emit, data) => emit.call(SuccessState(data)),
    );
  }

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) async {
    if (event is ThemeSwitchedEvent) {
      bool isDarkMode = false;
      await safeDataCall(
        emit,
        callToDb: isDark(),
        success: (emit, data) {
          isDarkMode = data ?? false;
          emit.call(SuccessState(!isDarkMode));
        },
      );
      setTheme(!isDarkMode);
    }
  }

  Future<Result<bool>> isDark() async {
    final bool? isDarkMode = await HiveHelper.get(HiveKeys.isDarkMode);
    return Success(isDarkMode ?? false);
  }

  Future<void> setTheme(bool isDark) async {
    await HiveHelper.put(key: HiveKeys.isDarkMode, value: isDark);
  }
}
