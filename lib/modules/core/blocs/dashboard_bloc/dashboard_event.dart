part of 'dashboard_bloc.dart';

abstract class DashBoardEvent extends Equatable {
  const DashBoardEvent();

  @override
  List<Object?> get props => [];
}

class InitEvent extends DashBoardEvent {
  const InitEvent();
  @override
  List<Object?> get props => [];
}

class ChangeNavBarEvent extends DashBoardEvent {
  final int newIndex;
  const ChangeNavBarEvent(this.newIndex);
  @override
  List<Object?> get props => [newIndex];
}
