import 'package:bloc/src/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/bloc/base_bloc.dart';
import '../../../core/bloc/event.dart';
import '../../../core/bloc/state.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc {
  HomeBloc()  : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) {
    throw UnimplementedError();
  }

}
