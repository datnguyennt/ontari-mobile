import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';
import 'package:ontari_mobile/core/routes/router.dart';
import 'package:ontari_mobile/generated/assets.gen.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';

abstract class AppIndexEnum {
  static const int homeTab = 0;
  static const int activity = 1;
  static const int catgory = 2;
  static const int setting = 3;
}

abstract class DashBoardNavigator {
  DashBoardNavigator();

  static final tabRoutes = [
    HomeRoute(),
    const ActivityRoute(),
    const CategoryRoute(),
    const SettingRoute(),
  ];
  static final List<BottomTabBar> items = [
    BottomTabBar(
      icon: Assets.icons.icHome.svg(),
      activeIcon: Assets.icons.icHome.svg(
        colorFilter: const ColorFilter.mode(
          AppColors.kprimary,
          BlendMode.srcIn,
        ),
      ),
      label: LocaleKeys.dashboard_home.tr(),
    ),
    BottomTabBar(
      icon: Assets.icons.icChart.svg(),
      activeIcon: Assets.icons.icChart.svg(
        colorFilter: const ColorFilter.mode(
          AppColors.kprimary,
          BlendMode.srcIn,
        ),
      ),
      label: LocaleKeys.dashboard_activity.tr(),
    ),
    BottomTabBar(
      icon: Assets.icons.icList.svg(),
      activeIcon: Assets.icons.icList.svg(
        colorFilter: const ColorFilter.mode(
          AppColors.kprimary,
          BlendMode.srcIn,
        ),
      ),
      label: LocaleKeys.dashboard_category.tr(),
    ),
    BottomTabBar(
      icon: Assets.icons.icSetting.svg(),
      activeIcon: Assets.icons.icSetting.svg(
        colorFilter: const ColorFilter.mode(
          AppColors.kprimary,
          BlendMode.srcIn,
        ),
      ),
      label: LocaleKeys.dashboard_setting.tr(),
    ),
  ];
}

class BottomTabBar {
  const BottomTabBar({
    required this.icon,
    required this.activeIcon,
    required this.label,
  });
  final Widget icon;
  final Widget activeIcon;
  final String label;
}
