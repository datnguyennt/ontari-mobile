import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ontari_mobile/core/common/theme/theme.export.dart';

class AppThemeData {
  static const MaterialColor kprimary =
      MaterialColor(_kprimaryPrimaryValue, <int, Color>{
    50: Color(0xFFEBEEFA),
    100: Color(0xFFDEE6F8),
    200: Color(0xFFC9D7F3),
    300: Color(0xFFA4BCEA),
    400: Color(0xFF7A9DE1),
    500: Color(_kprimaryPrimaryValue),
    600: Color(0xFF356AD1),
    700: Color(0xFF2C5EBF),
    800: Color(0xFF003F99),
    900: Color(0xFF003074),
  });
  static const int _kprimaryPrimaryValue = 0xFF5984D9;

  static const MaterialColor kprimaryAccent =
      MaterialColor(_kprimaryAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_kprimaryAccentValue),
    400: Color(0xFF9DB5FF),
    700: Color(0xFF84A2FF),
  });
  static const int _kprimaryAccentValue = 0xFFD0DCFF;

  static const MaterialColor kGreyscale =
      MaterialColor(_kGreyPrimaryValue, <int, Color>{
    50: Color(0xFFF0F5F9),
    100: Color(0xFFF3F7F9),
    200: Color(0xFFE8EAEE),
    300: Color(0xFFD0D5DC),
    400: Color(0xFFB6BEC9),
    500: Color(_kGreyPrimaryValue),
    600: Color(0xFF697896),
    700: Color(0xFF121F3E),
    800: Color(0xFF21273B),
    900: Color(0xFF191D2B),
  });
  static const int _kGreyPrimaryValue = 0xFF96A0B5;

  static const MaterialColor kgreyAccent =
      MaterialColor(_kGreyAccentValue, <int, Color>{
    100: Color(0xFFFFFFFF),
    200: Color(_kGreyAccentValue),
    400: Color(0xFF9EBBFF),
    700: Color(0xFF85A9FF),
  });
  static const int _kGreyAccentValue = 0xFFD1DFFF;

  static const _lightFillColor = Color.fromARGB(255, 187, 35, 35);
  static const _darkFillColor = Color.fromARGB(255, 146, 49, 49);

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      // Matches manifest.json colors and background color.
      // primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.background,
        elevation: 0,
        iconTheme: IconThemeData(color: colorScheme.primary),
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      canvasColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      highlightColor: Colors.transparent,
      focusColor: focusColor,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        contentTextStyle: _textTheme.titleMedium?.apply(color: _darkFillColor),
      ),
    );
  }

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: AppColors.kPrimaryLight,
    primaryContainer: Color(0xFF9e1718),
    secondary: AppColors.kDotUnselected,
    secondaryContainer: Color.fromARGB(255, 40, 105, 105),
    background: Colors.white,
    surface: Color.fromARGB(255, 21, 97, 97),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryContainer: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryContainer: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF),
    // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
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
}
