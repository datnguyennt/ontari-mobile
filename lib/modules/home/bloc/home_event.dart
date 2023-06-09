import 'package:ontari_mobile/core/bloc/event.dart';

abstract class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {}
