import 'package:ontari_mobile/core/bloc/event.dart';

abstract class ThemeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class ThemeSwitchedEvent extends ThemeEvent {
  final bool isDark;
  ThemeSwitchedEvent({this.isDark = false});
  @override
  List<Object?> get props => [isDark];
}
