import 'package:ontari_mobile/core/bloc/event.dart';

abstract class AppEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class AppThemeSwitchEvent extends AppEvent {
  AppThemeSwitchEvent();
  @override
  List<Object?> get props => [];
}

class AppLanguageSwitchEvent extends AppEvent {
  AppLanguageSwitchEvent();
  @override
  List<Object> get props => [];
}
