import 'package:bloc/src/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ontari_mobile/core/bloc/base_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/bloc/event.dart';

part 'home_state.dart';

class HomeBloc extends BaseBloc {
  HomeBloc()  : super(const InitialState());

  @override
  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit) {
    throw UnimplementedError();
  }

}
