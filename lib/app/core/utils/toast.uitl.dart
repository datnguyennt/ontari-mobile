import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';
import '../common/theme/theme.export.dart';

abstract class ToastUtil {
  static void showSuccess(
    BuildContext context, {
    String? message,
  }) {
    _showToast(
      context,
      message: message ?? LocaleKeys.text_success.tr,
      backgroundColor: AppColors.kGreen,
    );
  }

  static void showError(
    BuildContext context, {
    String? message,
  }) {
    _showToast(
      context,
      message: message ?? LocaleKeys.text_error_occur.tr,
      backgroundColor: Colors.redAccent,
    );
  }

  static Future<void> _showToast(
    BuildContext context, {
    required String message,
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = AppColors.kLightBlue,
    TextStyle? textStyle,
  }) async {
    final snackBar = SnackBar(
      content: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.all(AppSize.kSpacing12),
        child: Text(
          message,
          style: textStyle ?? AppStyles.bodyTextMedium(context),
        ),
      ),
      backgroundColor: backgroundColor,
      padding: EdgeInsets.zero,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(AppSize.kSpacing12),
      duration: duration,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        snackBar,
      );
  }
}
