import '../../../core/base/event.dart';

abstract class HomeEvent extends BaseEvent {
  @override
  List<Object?> get props => [];
}

class LoadHomeData extends HomeEvent {}
