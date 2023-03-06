import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clean_architech_bloc/app/constants/app_constants.dart';
import 'package:flutter_clean_architech_bloc/app/di/injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/util/theme/theme.dart';
import 'flavors.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void mainApp(Flavor flavor) async {
  AppFlavor.appFlavor = flavor;
  //
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();

  //Do this in main.dart
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(const App());
  });
}

Future<void> initializeApp() async {
  /// Init storage
  // await GetStorage.init();

  /// Init dependencies
  await configureDependencies();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          title: AppFlavor.title,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Get.deviceLocale,
          supportedLocales: supportedLocales,
          fallbackLocale: fallbackLocale,
        );
      },
    );
  }
}
