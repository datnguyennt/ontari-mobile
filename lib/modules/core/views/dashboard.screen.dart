import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontari_mobile/core/common/enum/app_index.enum.dart';
import 'package:ontari_mobile/core/common/extension/context.extension.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/generated/assets.gen.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';
import 'package:ontari_mobile/modules/activity/views/activity_screen.dart';
import 'package:ontari_mobile/modules/category/views/category_screen.dart';
import 'package:ontari_mobile/modules/core/blocs/dashboard_bloc/dashboard_bloc.dart';
import 'package:ontari_mobile/modules/home/views/home_screen.dart';
import 'package:ontari_mobile/modules/setting/views/setting_screen.dart';

@RoutePage()
class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final DashBoardBloc dashboardBloc = getIt<DashBoardBloc>();

  Color get selectedColor => context.isDarkMode
      ? AppColors.kprimary.shade600
      : AppColors.kprimary.shade900;

  Color get unSelectedColor => context.isDarkMode
      ? AppColors.kGreyscale.shade400
      : AppColors.kGreyscale.shade500;

  Color get bgColor =>
      context.isDarkMode ? AppColors.kGreyscale.shade800 : AppColors.kWhite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => dashboardBloc,
      child: Scaffold(
        bottomNavigationBar: _buildBottomNavigation(),
        body: _buildBody(),
      ),
    );
  }

  Widget _buildBottomNavigation() {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      builder: (context, state) {
        return Theme(
          data: ThemeData(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            currentIndex: state.currentIndex,
            backgroundColor: bgColor,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            iconSize: 24.w,
            elevation: 30,
            selectedItemColor: selectedColor,
            unselectedItemColor: unSelectedColor,
            selectedLabelStyle: AppStyles.buttonTextSmall(context).copyWith(
              fontSize: 12.sp,
              color: selectedColor,
            ),
            unselectedLabelStyle: AppStyles.buttonTextSmall(context).copyWith(
              fontSize: 12.sp,
              color: unSelectedColor,
            ),
            items: items,
            onTap: (index) {
              dashboardBloc.add(ChangeNavBarEvent(index));
            },
          ),
        );
      },
    );
  }

  Widget _buildBody() {
    return BlocBuilder<DashBoardBloc, DashBoardState>(
      buildWhen: (previous, current) =>
          previous.currentIndex != current.currentIndex,
      builder: (_, state) {
        if (state.currentIndex == AppIndexEnum.homeTab) {
          return HomeScreen();
        } else if (state.currentIndex == AppIndexEnum.activity) {
          return const ActivityScreen();
        } else if (state.currentIndex == AppIndexEnum.catgory) {
          return const CategoryScreen();
        } else if (state.currentIndex == AppIndexEnum.setting) {
          return SettingScreen();
        }
        return Container();
      },
    );
  }

  List<BottomNavigationBarItem> get items => [
        BottomNavigationBarItem(
          icon: Assets.icons.icHome.svg(
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(
              unSelectedColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: Assets.icons.icHome.svg(
            colorFilter: ColorFilter.mode(
              selectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          label: LocaleKeys.dashboard_home.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.icChart.svg(
            width: 20.w,
            height: 20.w,
            colorFilter: ColorFilter.mode(
              unSelectedColor,
              BlendMode.srcIn,
            ),
          ),
          activeIcon: Assets.icons.icChart.svg(
            colorFilter: ColorFilter.mode(
              selectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          label: LocaleKeys.dashboard_activity.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.icList.svg(
            colorFilter: ColorFilter.mode(
              unSelectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          activeIcon: Assets.icons.icList.svg(
            colorFilter: ColorFilter.mode(
              selectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          label: LocaleKeys.dashboard_category.tr(),
        ),
        BottomNavigationBarItem(
          icon: Assets.icons.icSetting.svg(
            colorFilter: ColorFilter.mode(
              unSelectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          activeIcon: Assets.icons.icSetting.svg(
            colorFilter: ColorFilter.mode(
              selectedColor,
              BlendMode.srcIn,
            ),
            width: 20.w,
            height: 20.w,
          ),
          label: LocaleKeys.dashboard_setting.tr(),
        ),
      ];
}
