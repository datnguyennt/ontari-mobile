import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontari_mobile/core/common/logger.dart';

class AppBlocObserver extends BlocObserver with LogMixin{
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    logD('onEvent $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logD('onChange $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    logD('onTransition $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logD('onError $error');
    super.onError(bloc, error, stackTrace);
  }
}