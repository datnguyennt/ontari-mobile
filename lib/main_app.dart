import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ontari_mobile/app.dart';
import 'package:ontari_mobile/app/di/injection.dart';
import 'package:ontari_mobile/firebase_options.dart';
import 'package:ontari_mobile/flavors.dart';

Future<void> mainApp(Flavor flavor) async {
  AppFlavor.appFlavor = flavor;
  //
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  runApp(const App());
  // return runZonedGuarded(() async {
  //   WidgetsFlutterBinding.ensureInitialized();
  //   await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //   FlutterError.onError = (errorDetails) {
  //     FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  //   };
  //   // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  //   PlatformDispatcher.instance.onError = (error, stack) {
  //     FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //     return true;
  //   };
  //   runApp(const App());
  // }, (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack);
  //   debugPrint(stack.toString());
  //   debugPrint(error.toString());
  // });
}

Future<void> initializeApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setPreferredOrientations();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;

  /// Init dependencies
  await configureDependencies();
}

Future<void> setPreferredOrientations() {
  return SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]);
}
