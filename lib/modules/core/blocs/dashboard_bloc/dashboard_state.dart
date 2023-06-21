part of 'dashboard_bloc.dart';

class DashBoardState extends Equatable {
  final int currentIndex;

  const DashBoardState({
    this.currentIndex = 0,
  });

  @override
  List<Object> get props => [currentIndex];
}
