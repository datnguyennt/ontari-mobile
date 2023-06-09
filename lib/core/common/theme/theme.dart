import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ontari_mobile/core/common/theme/app_color.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: textTheme(Brightness.light),
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: textTheme(Brightness.dark),
  );

  static TextTheme textTheme(Brightness brightness) {
    return TextTheme(
      headlineSmall: textStyle(brightness).copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        height: 19.12 / 14,
      ),
      headlineMedium: textStyle(brightness).copyWith(
        fontSize: 22.sp,
        fontWeight: FontWeight.w700,
        height: 38 / 22,
      ),
      headlineLarge: textStyle(brightness).copyWith(
        fontSize: 26.sp,
        fontWeight: FontWeight.w700,
        height: 35.52 / 26,
      ),
      bodyLarge: textStyle(brightness),
      bodyMedium: textStyle(brightness).copyWith(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
      ),
      bodySmall: textStyle(brightness).copyWith(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        height: 22 / 14,
      ),
    );
  }

  static TextStyle textStyle(Brightness brightness) {
    return GoogleFonts.manrope(
      color: brightness == Brightness.light
          ? AppColors.kPrimaryLight
          : AppColors.kWhite,
    ).copyWith(
      leadingDistribution: TextLeadingDistribution.even,
    );
  }
}
