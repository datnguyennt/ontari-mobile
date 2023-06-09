import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/bloc/state.dart';
import 'package:ontari_mobile/core/widget/base_widget.dart';
import 'package:ontari_mobile/modules/home/bloc/home_bloc.dart';

@RoutePage()
class HomeScreen extends BaseView<HomeBloc> {
  const HomeScreen({super.key});

  @override
  Widget buildView(BuildContext context, BaseState state) {
    throw UnimplementedError();
  }

  @override
  HomeBloc createBloc() {
    return HomeBloc();
  }
}
