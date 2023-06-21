import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/base/app_bloc_observer.dart';
import 'core/base/event.dart';
import 'core/base/state.dart';
import 'core/common/theme/app_theme.dart';
import 'core/constant/locales.dart';
import 'core/file.utils.dart';
import 'core/routes/router.dart';
import 'core/service/navigation_service.dart';
import 'core/utils/hive.helper.dart';
import 'core/utils/size_config.dart';
import 'core/widget/internet_status.view.dart';
import 'di/di.dart';
import 'flavors.dart';
import 'modules/auth/bloc/auth_bloc/auth_bloc.dart';
import 'modules/core/blocs/app_bloc/app_bloc.dart';

Future<void> mainApp(Flavor flavor) async {
  AppFlavor.appFlavor = flavor;
  await runZonedGuarded<Future<void>>(
    () async {
      await initializeApp();
      FlutterError.onError = (errorDetails) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      };
      // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
      PlatformDispatcher.instance.onError = (error, stack) {
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
        return true;
      };
      runApp(
        EasyLocalization(
          supportedLocales: AppLocales.supportedLocales,
          path: AppLocales.path,
          fallbackLocale: AppLocales.en,
          child: const MyApp(),
        ),
      );
    },
    (error, stack) =>
        FirebaseCrashlytics.instance.recordError(error, stack, fatal: true),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = getIt<AppRouter>();
  ThemeMode themeMode = ThemeMode.system;
  NavigationService get navigationService => getIt<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<AppBloc>()..add(InitialEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(InitialEvent()),
        ),
      ],
      child: Listener(
        onPointerDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocBuilder<AppBloc, BaseState>(
          builder: (context, state) {
            final appBloc = getIt<AppBloc>();
            themeMode = appBloc.isDarkMode ? ThemeMode.dark : ThemeMode.light;
            debugPrint(appBloc.currentLocale);
            final locale = appBloc.currentLocale == AppLocales.vi.languageCode
                ? AppLocales.vi
                : AppLocales.en;

            context.setLocale(locale);
            return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                  title: AppFlavor.title,
                  theme: AppThemeData.lightThemeData,
                  darkTheme: AppThemeData.darkThemeData,
                  themeMode: themeMode,
                  debugShowCheckedModeBanner: false,
                  routerConfig: _appRouter.config(),
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  builder: (context, child) {
                    if (state is LoadingDialogState) {
                      return const SizedBox.shrink();
                    }
                    SizeConfig.init(context);
                    return _buildApp(child);
                  },
                );
              },
            );
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
        final bool isConnectedInternet = [
          ConnectivityResult.mobile,
          ConnectivityResult.wifi,
          ConnectivityResult.ethernet,
        ].contains(result.data);
        return Stack(
          fit: StackFit.expand,
          children: [
            // child ?? const SizedBox.shrink(),
            _buildAppListener(child),
            if (!isConnectedInternet &&
                result.connectionState != ConnectionState.waiting)
              const InternetStatusView(),
          ],
        );
      },
    );
  }

  MultiBlocListener _buildAppListener(Widget? child) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, BaseState>(
          listener: (context, state) {
            if (state is ErrorViewState) {
              _appRouter.replaceAll([LoginRoute()]);
            } else if (state is SuccessState) {
              getIt<AppRouter>().replaceAll([const DashBoardRoute()]);
            }
          },
        ),
        // BlocListener<CoreBloc, CoreState>(
        //   listener: (context, state) {
        //     if (state is ReadyCoreState) {
        //       AppInitializationStatus.setAppInitializationStatus(
        //           AppInitEnum.coreInitialized);
        //       if (AppInitializationStatus.isAppInitializated()) {
        //         getIt<AppRouter>().replaceAll([DashboardRoute()]);
        //       }
        //     }
        //   },
        // ),
      ],
      child: child ?? const SizedBox.shrink(),
    );
  }
}

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Bloc logger
  Bloc.observer = AppBlocObserver();

  //Init firebase app
  await Firebase.initializeApp(options: AppFlavor.firebaseConfig);

  //Init translation
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];

  // Init Depedency Injection
  configureDependencies();

  //Init Local Stogare
  await Hive.initFlutter();
  await HiveHelper.openBox();

  // Init Application Directory
  await FileUtil.getApplicationDir();
}
