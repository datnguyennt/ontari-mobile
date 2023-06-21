import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/theme/theme.export.dart';
import '../utils/logger.dart';
import '../widget/loading.dart';
import 'base_bloc.dart';
import 'event.dart';
import 'state.dart';

abstract class BaseView<B extends BaseBloc> extends StatelessWidget
    with LogMixin {
  BaseView({super.key});
  final GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => createBloc(),
      child: BlocConsumer<B, BaseState>(
        listenWhen: (BaseState previous, BaseState current) {
          // return true/false to determine whether or not
          // to invoke listener with state
          return true;
        },
        listener: (BuildContext context, BaseState state) {
          // do stuff here based on BlocA's state
          if (state is LoadingDialogState) {
            _showLoading();
          }
          if (state is ErrorDialogState) {
            showErrorSnackBar(
              context,
              state.message ?? 'Error',
            );
          }
        },
        buildWhen: (BaseState previous, BaseState current) {
          // return true/false to determine whether or not
          // to rebuild the widget with state
          return rebuildViewWhen(previous, current);
        },
        builder: (contextBuilder, BaseState state) {
          // return widget here based on BlocA's state
          if (state is InitialState) {
            contextBuilder.read<B>().add(InitialEvent());
          }
          return buildView(contextBuilder, state);
        },
      ),
    );
  }

  bool rebuildViewWhen(BaseState previous, BaseState current) =>
      current is! DialogState;

  B createBloc();

  void showDialogView(
      {required BuildContext context, required Widget content}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(content: content);
      },
    );
  }

  Widget buildView(BuildContext context, BaseState state) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(
        //Status bar color for android
        statusBarColor: statusBarColor(),
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Material(
        color: Colors.transparent,
        child: pageScaffold(context),
      ),
    );
  }

  Widget body(BuildContext context);

  PreferredSizeWidget? appBar(BuildContext context);

  Widget pageScaffold(BuildContext context) {
    return Scaffold(
      //sets ios status bar color
      backgroundColor: pageBackgroundColor(),
      key: globalKey,
      appBar: appBar(context),
      floatingActionButton: floatingActionButton(),
      body: pageContent(context),
      bottomNavigationBar: bottomNavigationBar(),
      drawer: drawer(),
    );
  }

  Widget pageContent(BuildContext context) {
    return SafeArea(
      child: body(context),
    );
  }

  Widget showErrorSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });

    return Container();
  }

  void showToast(String message) {
    // Fluttertoast.showToast(
    //     msg: message,
    //     toastLength: Toast.LENGTH_SHORT,
    //     timeInSecForIosWeb: 1
    // );
  }

  Color pageBackgroundColor() {
    return AppColors.pageBackground;
  }

  Color statusBarColor() {
    return AppColors.pageBackground;
  }

  Widget? floatingActionButton() {
    return null;
  }

  Widget? bottomNavigationBar() {
    return null;
  }

  Widget? drawer() {
    return null;
  }

  Widget _showLoading() {
    return const Loading();
  }
}
