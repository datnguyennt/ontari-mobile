import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di/di.dart';
import '../common/logger.dart';
import '../network/failure.dart';
import '../service/navigation_service.dart';
import 'event.dart';
import 'state.dart';

abstract class BaseBloc extends Bloc<BaseEvent, BaseState> with LogMixin {
  NavigationService get navigationService => getIt<NavigationService>();

  BaseBloc(BaseState state) : super(state) {
    on<BaseEvent>((event, emit) async {
      if (event is InitialEvent) {
        await onInit(emit);
      } else {
        await handleEvent(event, emit);
      }
    });
  }

  Future<void> handleEvent(BaseEvent event, Emitter<BaseState> emit);

  Future<void> onInit(Emitter<BaseState> emit) async {}

  Future<void> safeDataCall<T>(
    Emitter<BaseState> emit, {
    Future<Either<Failure, T>>? callToHost,
    Future<Either<Failure, T>>? callToDb,
    Function(Emitter<BaseState> emit, T? data)? successFuncCallBack,
    Function(Emitter<BaseState> emit)? loadingFuncCallBack,
    Function(Emitter<BaseState> emit, String message)? errorFuncCallBack,
  }) async {
    assert(
      callToHost != null || callToDb != null,
      'at least callToHost or callToDb must be non-null ',
    );
    logD('callToHost');
    loadingFuncCallBack != null
        ? loadingFuncCallBack.call(emit)
        : emit(LoadingDialogState());

    // case 1: Call db before get data from host.
    // case 2: Only call db to get data
    if (callToDb != null) {
      logD('start call db');
      await (await callToDb).fold(
        (failed) async {
          if (callToHost == null) {
            if (errorFuncCallBack == null) {
              await hideDialogState();
              emit(ErrorDialogState(message: failed.message));
            } else {
              errorFuncCallBack.call(emit, failed.message);
            }
          }
        },
        (success) async {
          if (callToHost == null && successFuncCallBack == null) {
            await hideDialogState();
          }
          successFuncCallBack != null
              ? successFuncCallBack.call(emit, success)
              : emit(SuccessState(success));
        },
      );
    }

    // call data from host.
    if (callToHost != null) {
      logD('start call host');
      await (await callToHost).fold(
        (error) async {
          if (errorFuncCallBack == null) {
            await hideDialogState();
          }
          errorFuncCallBack != null
              ? errorFuncCallBack.call(emit, error.message)
              : emit(ErrorDialogState(message: error.message));
        },
        (success) async {
          if (successFuncCallBack == null) {
            await hideDialogState();
            emit(SuccessState(success));
          } else {
            successFuncCallBack.call(emit, success);
          }
        },
      );
    }
  }

  Future<void> hideDialogState()async {
    if (state is DialogState) {
      await navigationService.pop();
    }
  }
}
