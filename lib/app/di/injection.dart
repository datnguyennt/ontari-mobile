// ignore_for_file: await_only_futures

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:ontari_mobile/app/di/injection.config.dart';

final getIt = GetIt.instance;
//
// @InjectableInit()
// Future<void> configureDependencies() async => getIt.init();
@InjectableInit(
  initializerName: r'$initGetIt',
  // the default method name that will be generated
  preferRelativeImports: true,
  // default
  asExtension: false, // default
)
Future<void> configureDependencies() async {
  $initGetIt(getIt);
}
