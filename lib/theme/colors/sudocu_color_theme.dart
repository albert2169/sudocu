import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color.dart';
import 'package:sudocu/theme/colors/sudocu_color_palette.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme_extension.dart';

abstract class SudocuColorTheme {
  static SudocuColorThemeExtension light() {
    return SudocuColorThemeExtension(
      primary: SudocuColor(SudocuColorPalette.whiteColor.value),
      secondary: SudocuColor(SudocuColorPalette.greyTextColor.value),
      backgroundPrimary: SudocuColor(SudocuColorPalette.backgroundDarkColor.value),
      backgroundSecondary: SudocuColor(SudocuColorPalette.buttonPinkColor.value),
      backgroundTertiary: SudocuColor(SudocuColorPalette.backgroundLightAccentColor.value),
      gameColor1: SudocuColor(SudocuColorPalette.gameColor1.value),
      gameColor2: SudocuColor(SudocuColorPalette.gameColor2.value),
      gameColor3: SudocuColor(SudocuColorPalette.gameColor3.value),
      gameColor4: SudocuColor(SudocuColorPalette.gameColor4.value),
      gameColor5: SudocuColor(SudocuColorPalette.gameColor5.value),
      gameColor6: SudocuColor(SudocuColorPalette.gameColor6.value),
      gameColor7: SudocuColor(SudocuColorPalette.gameColor7.value),
      gameColor8: SudocuColor(SudocuColorPalette.gameColor8.value),
      gameColor9: SudocuColor(SudocuColorPalette.gameColor9.value),

      barChartColor: SudocuColor(SudocuColorPalette.primaryLightColor.value),
      brightness: Brightness.light,
      tertiary: SudocuColor(SudocuColorPalette.accentLightColor.value),
      foregroundPrimary: SudocuColor(SudocuColorPalette.blueColor.value),
      foregroundSecondary: SudocuColor(SudocuColorPalette.textSecondaryLightColor.value),
      foregroundTertiary: SudocuColor(SudocuColorPalette.textDisabledLightColor.value),
    );
  }

  static SudocuColorThemeExtension of(BuildContext context) {
    final colorTheme = Theme.of(context).extension<SudocuColorThemeExtension>();

    if (colorTheme == null) return light();

    return colorTheme;
  }
}
