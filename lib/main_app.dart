import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

// import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ontari_mobile/core/bloc/app_bloc_observer.dart';
import 'package:ontari_mobile/core/bloc/event.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/constant/locales.dart';
import 'package:ontari_mobile/core/file.utils.dart';
import 'package:ontari_mobile/core/hive.helper.dart';
import 'package:ontari_mobile/core/routes/router.dart';
import 'package:ontari_mobile/core/common/theme/app_theme.dart';
import 'package:ontari_mobile/core/common/size_config.dart';
import 'package:ontari_mobile/core/service/navigation_service.dart';
import 'package:ontari_mobile/core/widget/internet_status.view.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/flavors.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:ontari_mobile/modules/core/blocs/bloc/theme_bloc.dart';

Future<void> mainApp(Flavor flavor, currentPlatform) async {
  AppFlavor.appFlavor = flavor;
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp(currentPlatform);
  runApp(
    EasyLocalization(
      supportedLocales: const [AppLocales.en, AppLocales.vi],
      path: AppLocales.path,
      fallbackLocale: AppLocales.en,
      child: const MyApp(),
    ),
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
          create: (context) => getIt<ThemeBloc>()..add(InitialEvent()),
        ),
        BlocProvider(
          create: (context) => getIt<AuthBloc>()..add(InitialEvent()),
        ),
      ],
      child: Listener(
        onPointerDown: (_) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: BlocListener<ThemeBloc, BaseState>(
          listener: (context, state) {
            if (state is InitialState) {
              themeMode = ThemeMode.system;
            } else if (state is SuccessState) {
              bool isDarkMode = state.data;
              themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
            }
          },
          child: ScreenUtilInit(
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
              );
            },
          ),
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

              //  navigationService.pushAndRemoveUntil(
              //   LoginRoute(),
              //   predicate: (Route<dynamic> route) {
              //     return false;
              //   },
              // );
              // getIt<AppRouter>().replaceAll([LoginRoute()]);
            } else if (state is SuccessState) {
              // _appRouter.popUntilRouteWithPath(Routes.home);
              //  .re(
              //   HomeRoute(),
              //   predicate: (Route<dynamic> route) {
              //     return false;
              //   },
              // );
              getIt<AppRouter>().replaceAll([ HomeRoute()]);
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

Future<void> initializeApp(FirebaseOptions currentPlatform) async {
  Bloc.observer = AppBlocObserver();

  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await Hive.initFlutter();
  await FileUtil.getApplicationDir();
  await HiveHelper.openBox();
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
