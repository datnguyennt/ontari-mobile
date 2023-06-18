import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../core/bloc/state.dart';
import '../../../core/widget/base_widget.dart';
import '../../../data/database/firebase_database.dart';
import '../../../di/di.dart';
import '../../../generated/locale_keys.g.dart';
import '../../auth/bloc/auth_bloc/auth_bloc.dart';
import '../bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends BaseView<HomeBloc> {
  final FirebaseDataBase firebaseDataBase = getIt<FirebaseDataBase>();
  final authBloc = getIt<AuthBloc>();
  HomeScreen({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      body: Center(
        child: Text(
          LocaleKeys.dashboard_home.tr(),
        ),
      ),
    );
  }

  @override
  HomeBloc createBloc() {
    return HomeBloc();
  }
}
