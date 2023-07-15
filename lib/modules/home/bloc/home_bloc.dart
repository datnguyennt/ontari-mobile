import 'package:bloc/src/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/base/base_bloc.dart';
import '../../../core/base/event.dart';
import '../../../core/base/state.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc {
  HomeBloc() : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) {
    throw UnimplementedError();
  }
}
