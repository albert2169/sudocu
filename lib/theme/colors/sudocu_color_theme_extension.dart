import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color.dart';

const _halfT = 0.5;

@immutable
class SudocuColorThemeExtension extends ThemeExtension<SudocuColorThemeExtension> {
  const SudocuColorThemeExtension({
    required this.barChartColor,
    required this.brightness,
    required this.primary,
    required this.secondary,
    required this.tertiary,
    required this.foregroundPrimary,
    required this.foregroundSecondary,
    required this.foregroundTertiary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.gameColor1,
    required this.gameColor2,
    required this.gameColor3,
    required this.gameColor4,
    required this.gameColor5,
    required this.gameColor6,
    required this.gameColor7,
    required this.gameColor8,
    required this.gameColor9,
  });

  final SudocuColor gameColor1;
  final SudocuColor gameColor2;
  final SudocuColor gameColor3;
  final SudocuColor gameColor4;
  final SudocuColor gameColor5;
  final SudocuColor gameColor6;
  final SudocuColor gameColor7;
  final SudocuColor gameColor8;
  final SudocuColor gameColor9;

  final Brightness brightness;

  final SudocuColor primary;
  final SudocuColor secondary;
  final SudocuColor tertiary;

  final SudocuColor foregroundPrimary;
  final SudocuColor foregroundSecondary;
  final SudocuColor foregroundTertiary;

  final SudocuColor backgroundPrimary;
  final SudocuColor backgroundSecondary;
  final SudocuColor backgroundTertiary;

  final SudocuColor barChartColor;

  @override
  int get hashCode => Object.hash(
        primary,
        secondary,
        tertiary,
        foregroundPrimary,
        foregroundSecondary,
        foregroundTertiary,
        backgroundPrimary,
        backgroundSecondary,
        backgroundTertiary,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SudocuColorThemeExtension &&
          runtimeType == other.runtimeType &&
          primary == other.primary &&
          secondary == other.secondary &&
          tertiary == other.tertiary &&
          foregroundPrimary == other.foregroundPrimary &&
          foregroundSecondary == other.foregroundSecondary &&
          foregroundTertiary == other.foregroundTertiary &&
          backgroundPrimary == other.backgroundPrimary &&
          backgroundSecondary == other.backgroundSecondary &&
          backgroundTertiary == other.backgroundTertiary;

  @override
  SudocuColorThemeExtension copyWith({
    SudocuColor? primary,
    SudocuColor? secondary,
  }) {
    return SudocuColorThemeExtension(
      barChartColor: barChartColor,
      brightness: brightness,
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      tertiary: tertiary,
      foregroundPrimary: foregroundPrimary,
      foregroundSecondary: foregroundSecondary,
      foregroundTertiary: foregroundTertiary,
      backgroundPrimary: backgroundPrimary,
      backgroundSecondary: backgroundSecondary,
      backgroundTertiary: backgroundTertiary,
      gameColor1: gameColor1,
      gameColor2: gameColor2,
      gameColor3: gameColor3,
      gameColor4: gameColor4,
      gameColor5: gameColor5,
      gameColor6: gameColor6,
      gameColor7: gameColor7,
      gameColor8: gameColor8,
      gameColor9: gameColor9,
    );
  }

  @override
  ThemeExtension<SudocuColorThemeExtension> lerp(
    covariant ThemeExtension<SudocuColorThemeExtension>? other,
    double t,
  ) {
    if (other is! SudocuColorThemeExtension) {
      return this;
    }

    return SudocuColorThemeExtension(
      brightness: t < _halfT ? brightness : other.brightness,
      primary: primary.lerp(other.primary, t),
      secondary: secondary.lerp(other.secondary, t),
      tertiary: tertiary.lerp(other.tertiary, t),
      foregroundPrimary: foregroundPrimary.lerp(other.foregroundPrimary, t),
      foregroundSecondary: foregroundSecondary.lerp(other.foregroundSecondary, t),
      foregroundTertiary: foregroundTertiary.lerp(other.foregroundTertiary, t),
      backgroundPrimary: backgroundPrimary.lerp(other.backgroundPrimary, t),
      backgroundSecondary: backgroundSecondary.lerp(other.backgroundSecondary, t),
      backgroundTertiary: backgroundTertiary.lerp(other.backgroundTertiary, t),
      barChartColor: barChartColor.lerp(other.barChartColor, t),
      gameColor1: gameColor1.lerp(other.gameColor1, t),
      gameColor2: gameColor2.lerp(other.gameColor2, t),
      gameColor3: gameColor3.lerp(other.gameColor3, t),
      gameColor4: gameColor4.lerp(other.gameColor4, t),
      gameColor5: gameColor5.lerp(other.gameColor5, t),
      gameColor6: gameColor6.lerp(other.gameColor6, t),
      gameColor7: gameColor7.lerp(other.gameColor7, t),
      gameColor8: gameColor8.lerp(other.gameColor8, t),
      gameColor9: gameColor9.lerp(other.gameColor9, t),
    );
  }

  static SudocuColorThemeExtension of(BuildContext context) {
    return Theme.of(context).extension<SudocuColorThemeExtension>()!;
  }
}