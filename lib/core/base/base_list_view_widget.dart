import 'package:flutter/material.dart';

import 'base_bloc.dart';
import 'base_view.dart';
import 'state.dart';

abstract class BaseListView<B extends BaseBloc, M> extends BaseView<B> {
  BaseListView({super.key});


  @override
  Widget buildView(BuildContext context, BaseState state) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: bodyView(context, state),
    );
  }

  Widget bodyView(BuildContext context, BaseState state) {
    if (state is InitialState || state is LoadingViewState) {
      return loadingView(context);
    } else if (state is SuccessState) {
      final dataList = state.data;
      if (dataList is List<M>) {
        return successView(context, dataList);
      } else {
        return errorView(context, 'Data invalid');
      }
    } else if (state is ErrorViewState) {
      return errorView(context, state.message);
    }
    return Container();
  }

  Widget successView(BuildContext context, List<M> data) {
    return ListView.builder(
      itemBuilder: (context, index) => itemListView(context, data[index]),
      itemCount: data.length,
    );
  }

  Widget itemListView(BuildContext context, M object) {
    return Container();
  }

  Widget loadingView(BuildContext context) {
    return const CircularProgressIndicator();
  }

  Widget errorView(BuildContext context, String? message) {
    return Text(message ?? 'Error');
  }

  AppBar? buildAppBar(BuildContext context) {
    return null;
  }
}
