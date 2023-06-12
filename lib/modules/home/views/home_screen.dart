import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/widget/base_widget.dart';
import 'package:ontari_mobile/data/database/firebase_database.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/generated/locale_keys.g.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:ontari_mobile/modules/home/bloc/home_bloc.dart';

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
