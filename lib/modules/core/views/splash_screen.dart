import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.kPrimaryLight,
      body: Center(
        child: CircularProgressIndicator(
          color: AppColors.kWhite,
        ),
      ),
    );
  }
}
