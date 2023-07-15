import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/base/base_view.dart';
import '../../../core/widget/custom_app_bar.dart';
import '../../../generated/locale_keys.g.dart';
import '../bloc/home_bloc.dart';

@RoutePage()
class HomeView extends BaseView<HomeBloc> {
  HomeView({super.key}) {
    logD('Hello');
  }

  @override
  HomeBloc createBloc() {
    return HomeBloc();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return const CustomAppBar(
      appBarTitleText: 'Home',
      isBackButtonEnabled: false,
    );
  }

  @override
  Widget body(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.dashboard_home.tr(),
      ),
    );
  }
}
