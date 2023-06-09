import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ontari_mobile/core/constant/app_constants.dart';
import 'package:ontari_mobile/core/file.utils.dart';
import 'package:ontari_mobile/core/hive.helper.dart';
import 'package:ontari_mobile/core/routes/router.dart';
import 'package:ontari_mobile/core/common/theme/app_theme.dart';
import 'package:ontari_mobile/core/common/size_config.dart';
import 'package:ontari_mobile/core/widget/internet_status.view.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/flavors.dart';
import 'package:ontari_mobile/generated/app_localizations.g.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart';

Future<void> mainApp(Flavor flavor, currentPlatform) async {
  AppFlavor.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider(
        //   create: (context) => getIt<CoreBloc>()..add(InitCoreEvent()),
        // ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>(),
        ),
      ],
      child: Listener(
        onPointerDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: MaterialApp.router(
          title: AppFlavor.title,
          theme: AppThemeData.lightThemeData,
          darkTheme: AppThemeData.darkThemeData,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: (deviceLocale, supportedLocales) {
            if (deviceLocale != null &&
                supportedLocales.contains(deviceLocale)) {
              return deviceLocale;
            } else {
              return const Locale('en', 'US');
            }
          },
          builder: (context, child) {
            SizeConfig.init(context);
            return _buildApp(child);
          },
        ),
      ),
    );
  }

  StreamBuilder<ConnectivityResult> _buildApp(Widget? child) {
    return StreamBuilder(
      stream: Connectivity().onConnectivityChanged,
      builder:
          (BuildContext context, AsyncSnapshot<ConnectivityResult> result) {
        bool isConnectedInternet = [
          ConnectivityResult.mobile,
          ConnectivityResult.wifi,
          ConnectivityResult.ethernet,
        ].contains(result.data);
        return Stack(
          fit: StackFit.expand,
          children: [
            child ?? const SizedBox.shrink(),
            // _buildAppListener(child),
            if (!isConnectedInternet &&
                result.connectionState != ConnectionState.waiting)
              const InternetStatusView(),
          ],
        );
      },
    );
  }

  // MultiBlocListener _buildAppListener(Widget? child) {
  //   return MultiBlocListener(
  //     listeners: [
  //       BlocListener<AuthBloc, AuthState>(
  //         listener: (context, state) {
  //           if (state is AuthenticatedState) {
  //             AppInitializationStatus.setAppInitializationStatus(
  //                 AppInitEnum.authInitialized);
  //             if (AppInitializationStatus.isAppInitializated()) {
  //               getIt<AppRouter>().replaceAll([DashboardRoute()]);
  //             }
  //           } else if (state is UnauthenticatedState) {
  //             getIt<AppRouter>().replaceAll([const LoginRoute()]);
  //           }
  //         },
  //       ),
  //       // BlocListener<CoreBloc, CoreState>(
  //       //   listener: (context, state) {
  //       //     if (state is ReadyCoreState) {
  //       //       AppInitializationStatus.setAppInitializationStatus(
  //       //           AppInitEnum.coreInitialized);
  //       //       if (AppInitializationStatus.isAppInitializated()) {
  //       //         getIt<AppRouter>().replaceAll([DashboardRoute()]);
  //       //       }
  //       //     }
  //       //   },
  //       // ),
  //     ],
  //     child: child ?? const SizedBox.shrink(),
  //   );
  // }
}

Future<void> initializeApp(FirebaseOptions currentPlatform) async {
  await Hive.initFlutter();
  await FileUtil.getApplicationDir();
  await HiveHelper.openBox(HiveKeys.authBox);
  configureDependencies();
  await Firebase.initializeApp(
    options: currentPlatform,
  );
  // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
  // PlatformDispatcher.instance.onError = (error, stack) {
  //   FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //   return true;
  // };
}
