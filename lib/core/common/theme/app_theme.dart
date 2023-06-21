import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../extension/context.extension.dart';
import 'theme.export.dart';

class AppThemeData {
  // Light Theme
  static ThemeData lightThemeData = themeData(Brightness.light);

  //Dark Theme
  static ThemeData darkThemeData = themeData(Brightness.dark);

  //Common Theme
  static ThemeData themeData(Brightness brightness) {
    return ThemeData(
      brightness: brightness,
      colorScheme: lightColorScheme(brightness),
      textTheme: _textTheme,
      primaryTextTheme: _textTheme,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(),
      ),
      inputDecorationTheme: _textFieldInputdecoration(brightness),
    );
  }

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

  static ColorScheme lightColorScheme(Brightness brightness) => ColorScheme(
    brightness: brightness,
    primary: brightness.isDarkMode ?const Color(0xFFB0C6FF): const Color(0xFF365CA8),
    onPrimary: const Color(0xFFFFFFFF),
    primaryContainer: const Color(0xFFD9E2FF),
    onPrimaryContainer: const Color(0xFF001944),
    secondary: const Color(0xFF3F5AA9),
    onSecondary: const Color(0xFFFFFFFF),
    secondaryContainer: const Color(0xFFDBE1FF),
    onSecondaryContainer: const Color(0xFF00174C),
    tertiary: const Color(0xFF725572),
    onTertiary: const Color(0xFFFFFFFF),
    tertiaryContainer: const Color(0xFFFDD7FA),
    onTertiaryContainer: const Color(0xFF2A132C),
    error: const Color(0xFFC00011),
    onError: const Color(0xFFFFFFFF),
    errorContainer: const Color(0xFFFFDAD6),
    onErrorContainer: const Color(0xFF410002),
    outline: const Color(0xFF757780),
    background: const Color(0xFFFAFDFD),
    onBackground: const Color(0xFF191C1D),
    surface: const Color(0xFFF8FAFA),
    onSurface: const Color(0xFF191C1D),
    surfaceVariant: const Color(0xFFE1E2EC),
    onSurfaceVariant: const Color(0xFF44464F),
    inverseSurface: const Color(0xFF2E3132),
    onInverseSurface: const Color(0xFFEFF1F1),
    inversePrimary: const Color(0xFFB0C6FF),
    shadow: const Color(0xFF000000),
    surfaceTint: const Color(0xFF365CA8),
    outlineVariant: const Color(0xFFC5C6D0),
    scrim: const Color(0xFF000000),
  );

  static const darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFB0C6FF),
    onPrimary: Color(0xFF002D6E),
    primaryContainer: Color(0xFF18438F),
    onPrimaryContainer: Color(0xFFD9E2FF),
    secondary: Color(0xFFB4C4FF),
    onSecondary: Color(0xFF022978),
    secondaryContainer: Color(0xFF254290),
    onSecondaryContainer: Color(0xFFDBE1FF),
    tertiary: Color(0xFFDFBBDE),
    onTertiary: Color(0xFF412742),
    tertiaryContainer: Color(0xFF593D5A),
    onTertiaryContainer: Color(0xFFFDD7FA),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    outline: Color(0xFF8F9099),
    background: Color(0xFF191C1D),
    onBackground: Color(0xFFE1E3E3),
    surface: Color(0xFF101415),
    onSurface: Color(0xFFC4C7C7),
    surfaceVariant: Color(0xFF44464F),
    onSurfaceVariant: Color(0xFFC5C6D0),
    inverseSurface: Color(0xFFE1E3E3),
    onInverseSurface: Color(0xFF191C1D),
    inversePrimary: Color(0xFF365CA8),
    shadow: Color(0xFF000000),
    surfaceTint: Color(0xFFB0C6FF),
    outlineVariant: Color(0xFF44464F),
    scrim: Color(0xFF000000),
  );
}
