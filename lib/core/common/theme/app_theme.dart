import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';

class AppThemeData {
  // Light Theme
  static ThemeData lightThemeData = themeData(Brightness.light);

  //Dark Theme
  static ThemeData darkThemeData = themeData(Brightness.dark);

  //Common Theme
  static ThemeData themeData(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme(brightness),
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme(brightness).background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme(brightness).primary),
      ),
      iconTheme: IconThemeData(color: colorScheme(brightness).onPrimary),
      inputDecorationTheme: _textFieldInputdecoration(brightness),
    );
  }

  static ColorScheme colorScheme(Brightness brightness) => const ColorScheme(
        primary: AppColors.kPrimaryLight,
        primaryContainer: Color(0xFF9e1718),
        secondary: AppColors.kDotUnselected,
        secondaryContainer: Color.fromARGB(255, 40, 105, 105),
        background: Colors.white,
        surface: Color.fromARGB(255, 21, 97, 97),
        onBackground: Colors.white,
        error: AppColors.kRed,
        onError: AppColors.kRed,
        onPrimary: AppColors.kprimary,
        onSecondary: Color(0xFF322942),
        onSurface: Color(0xFF241E30),
        brightness: Brightness.light,
      );

  // static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w400;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    displayLarge: GoogleFonts.manrope(fontWeight: _bold, fontSize: 26),
    displayMedium: GoogleFonts.manrope(fontWeight: _bold, fontSize: 22),
    displaySmall: GoogleFonts.manrope(fontWeight: _semiBold, fontSize: 16),
    headlineMedium: GoogleFonts.manrope(fontWeight: _semiBold, fontSize: 14),
    headlineSmall: GoogleFonts.manrope(fontWeight: _medium, fontSize: 14),
    titleLarge: GoogleFonts.manrope(fontWeight: _medium, fontSize: 12),
    bodyLarge: GoogleFonts.manrope(fontWeight: _medium, fontSize: 16),
    bodyMedium: GoogleFonts.manrope(fontWeight: _medium, fontSize: 14),
    labelLarge: GoogleFonts.manrope(fontWeight: _medium, fontSize: 16),
  );

  static InputDecorationTheme _textFieldInputdecoration(Brightness brightness) {
    return InputDecorationTheme(
      isDense: true,
      constraints: const BoxConstraints(),
      border: _buildBorder(brightness),
      enabledBorder: _buildBorder(brightness),
      focusedBorder: _buildFocusedBorder(brightness),
      errorBorder: _buildErrorBorder(brightness),
      disabledBorder: _buildBorder(brightness),
      filled: true,
      fillColor: brightness == Brightness.dark
          ? AppColors.kGreyscale.shade800
          : AppColors.kWhite,
    );
  }

  static OutlineInputBorder _buildFocusedBorder(Brightness brightness) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: brightness == Brightness.dark
            ? AppColors.kprimary.shade600
            : AppColors.kprimary.shade900,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }

  static OutlineInputBorder _buildBorder(Brightness brightness) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: brightness == Brightness.dark
            ? AppColors.kGreyscale.shade800
            : AppColors.kGreyscale.shade50,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }

  static OutlineInputBorder _buildErrorBorder(Brightness brightness) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.kRed,
        width: 1.r,
      ),
      borderRadius: BorderRadius.circular(
        AppSize.kRadius10.r,
      ),
    );
  }
}
