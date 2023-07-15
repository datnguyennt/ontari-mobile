import 'package:flutter/material.dart';

import '../common/theme/theme.export.dart';

//Default appbar customized with the design of our app
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;

  const CustomAppBar({
    required this.appBarTitleText,
    this.actions,
    this.isBackButtonEnabled = true,
    super.key,
  });

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.kprimary,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.kprimary),
      title: AppBarTitle(text: appBarTitleText),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  final String text;

  const AppBarTitle({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      // style: pageTitleStyle,
      textAlign: TextAlign.center,
    );
  }
}
