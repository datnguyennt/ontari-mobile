import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/common/enum/app_index.enum.dart';
import '../../../core/common/theme/theme.export.dart';
import '../../../di/di.dart';
import '../../activity/views/activity_screen.dart';
import '../../category/views/category_screen.dart';
import '../../home/views/home_screen.dart';
import '../../setting/views/setting_screen.dart';
import '../blocs/dashboard_bloc/dashboard_bloc.dart';

@RoutePage()
class DashBoardScreen extends StatelessWidget {
  DashBoardScreen({super.key});

  final DashBoardBloc dashboardBloc = getIt<DashBoardBloc>();

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
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: AppColors.kprimary,
            unselectedItemColor: AppColors.kGreyscale.shade500,
            selectedLabelStyle: AppStyles.buttonTextSmall(context),
            unselectedLabelStyle: AppStyles.buttonTextSmall(context),
            items: DashBoardNavigator.items
                .map(
                  (tab) => BottomNavigationBarItem(
                    label: tab.label,
                    icon: tab.icon,
                    activeIcon: tab.activeIcon,
                  ),
                )
                .toList(),
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
          return const SettingScreen();
        }
        return Container();
      },
    );
  }
}
