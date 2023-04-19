import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ontari_mobile/app/routes/app_pages.dart';
import 'package:ontari_mobile/app/util/theme/app_theme.dart';
import 'package:ontari_mobile/flavors.dart';
import 'package:ontari_mobile/generated/locales.g.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            title: AppFlavor.title,
            darkTheme: AppThemeData.darkThemeData,
            theme: AppThemeData.lightThemeData,
            debugShowCheckedModeBanner: false,
            translationsKeys: AppTranslation.translations,
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            locale: const Locale('vi', 'VN'),
          );
        },
      ),
    );
  }
}
