import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/widget/base_widget.dart';
import 'package:ontari_mobile/di/di.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_bloc.dart';
import 'package:ontari_mobile/modules/auth/bloc/auth_bloc/auth_event.dart';
import 'package:ontari_mobile/modules/home/bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends BaseView<HomeBloc> {
  final authBloc = getIt<AuthBloc>();
  HomeScreen({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      body: Center(
        child: InkWell(
            onTap: () async {
              authBloc.add(AppLogoutRequested());
            },
            child: Text('Home View')),
      ),
    );
  }

  @override
  HomeBloc createBloc() {
    return HomeBloc();
  }
}
