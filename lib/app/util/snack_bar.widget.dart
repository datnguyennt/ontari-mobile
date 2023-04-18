import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ontari_mobile/app/util/theme/theme.export.dart';

class MessageToast {
  static void showErrorToast([
    String? message,
    Duration? duration,
  ]) {
    Get..closeAllSnackbars()
    ..rawSnackbar(
      messageText: Center(
        child: Text(
          message ?? 'Error',
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: AppColors.kWhite,
      borderRadius: AppSize.kRadius10,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.kSpacing20,
        vertical: AppSize.kSpacing20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.kSpacing12,
        vertical: AppSize.kSpacing8,
      ),
    );
  }

  static void showSuccessToast(
    String message, {
    Duration? duration,
  }) {
    Get..closeAllSnackbars()
    ..rawSnackbar(
      messageText: Center(
        child: Text(
          message,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        ),
      ),
      duration: duration ?? const Duration(seconds: 3),
      backgroundColor: AppColors.kRed,
      borderRadius: AppSize.kRadius10,
      margin: const EdgeInsets.symmetric(
        horizontal: AppSize.kSpacing20,
        vertical: AppSize.kSpacing20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.kSpacing12,
        vertical: AppSize.kSpacing8,
      ),
    );
  }
}
