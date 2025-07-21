
import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class SudocuTheme {
  static ThemeData get(Brightness mode) {
    final colorTheme = SudocuColorTheme.light();

    return ThemeData(
      useMaterial3: false,
      applyElevationOverlayColor: false,
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: colorTheme.backgroundPrimary,
      primaryColor: colorTheme.primary,

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorTheme.primary,
          textStyle: TextStyle(color: colorTheme.primary),
          backgroundColor: colorTheme.primary,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: colorTheme.primary,
        primary: colorTheme.primary,
        secondary: colorTheme.secondary,
        brightness: Brightness.light,
        surface: colorTheme.backgroundPrimary,
      ),

   
      extensions: <ThemeExtension<dynamic>>[colorTheme],
    );
  }
}
