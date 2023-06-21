import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/state.dart';
import '../../../core/common/theme/theme.export.dart';
import '../../../core/constant/locales.dart';
import '../../../generated/locale_keys.g.dart';
import '../../auth/bloc/auth_bloc/auth_bloc.dart';
import '../../auth/bloc/auth_bloc/auth_event.dart';
import '../../core/blocs/app_bloc/app_bloc.dart';
import '../../core/blocs/app_bloc/app_event.dart';

@RoutePage()
class SettingView extends StatelessWidget {
  final AppBloc themeBloc = AppBloc.to;
  SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.kHorizonSpace.w),
      child: Scaffold(
          body: SafeArea(
        child: Column(
          children: [
            Text(
              LocaleKeys.dashboard_setting.tr(),
              style: AppStyles.headline1(context).copyWith(
                fontSize: 24.sp,
                fontWeight: FontWeight.w800,
                color: themeBloc.isDarkMode
                    ? AppColors.kWhite
                    : AppColors.kGreyscale.shade700,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                throw Exception('Error recored ${DateTime.now().toLocal()}');
              },
              child: const Text('record error'),
            ),
            BlocBuilder<AppBloc, BaseState>(
              builder: (context, state) {
                return Switch(
                  value: themeBloc.isDarkMode,
                  onChanged: (value) {
                    themeBloc.add(AppThemeSwitchEvent());
                  },
                );
              },
            ),
            IconButton(
              onPressed: () async {
                final bloc = AuthBloc.to;
                bloc.add(AppLogoutRequested());
              },
              icon: const Icon(
                Icons.abc_outlined,
              ),
            ),
            BlocBuilder<AppBloc, BaseState>(
              builder: (context, state) {
                return Switch(
                  value: themeBloc.currentLocale == AppLocales.en.languageCode,
                  onChanged: (value) {
                    // EasyLocalization.of(context)!.setLocale(AppLocales.vi);
                    themeBloc.add(AppLanguageSwitchEvent());
                  },
                );
              },
            ),
          ],
        ),
      )),
    );
  }
}
