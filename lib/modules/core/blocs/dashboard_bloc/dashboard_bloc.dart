import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/core/common/enum/app_index.enum.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

@injectable
class DashBoardBloc extends Bloc<DashBoardEvent, DashBoardState> {
  DashBoardBloc() : super(const DashBoardState()) {
    on<InitEvent>(_onInitDashBoardEvent);
    on<ChangeNavBarEvent>(_onChangeNavItem);
  }

  void _onInitDashBoardEvent(
    InitEvent event,
    Emitter<DashBoardState> emit,
  ) {
    emit(const DashBoardState());
  }

  void _onChangeNavItem(ChangeNavBarEvent event, Emitter<DashBoardState> emit) {
    switch (event.newIndex) {
      case 0:
        emit(const DashBoardState());
        break;
      case 1:
        emit(const DashBoardState(currentIndex: AppIndexEnum.activity));
        break;
      case 2:
        emit(const DashBoardState(currentIndex: AppIndexEnum.catgory));
        break;
      case 3:
        emit(const DashBoardState(currentIndex: AppIndexEnum.setting));
        break;
    }
  }

  void _onScroll(ScrollController? scrollController) {
    if (scrollController != null && scrollController.hasClients) {
      scrollController.animateTo(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    }
  }
}
