// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart' as _i8;
import 'package:sudocu/presentation/screens/main_menu_screen/main_menu_screen.dart'
    as _i1;
import 'package:sudocu/presentation/screens/rules_screen/rules_screen.dart'
    as _i2;
import 'package:sudocu/presentation/screens/settings_screen/settings.dart'
    as _i3;
import 'package:sudocu/presentation/screens/spash_screen/splash_screen.dart'
    as _i4;
import 'package:sudocu/presentation/screens/sudocu_screen/sudocu_screen.dart'
    as _i5;

/// generated route for
/// [_i1.MainMenuScreen]
class MainMenuRoute extends _i6.PageRouteInfo<void> {
  const MainMenuRoute({List<_i6.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i2.RulesScreen]
class RulesRoute extends _i6.PageRouteInfo<void> {
  const RulesRoute({List<_i6.PageRouteInfo>? children})
    : super(RulesRoute.name, initialChildren: children);

  static const String name = 'RulesRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.RulesScreen();
    },
  );
}

/// generated route for
/// [_i3.Settings]
class Settings extends _i6.PageRouteInfo<void> {
  const Settings({List<_i6.PageRouteInfo>? children})
    : super(Settings.name, initialChildren: children);

  static const String name = 'Settings';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.Settings();
    },
  );
}

/// generated route for
/// [_i4.SplashScreen]
class SplashRoute extends _i6.PageRouteInfo<void> {
  const SplashRoute({List<_i6.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SplashScreen();
    },
  );
}

/// generated route for
/// [_i5.SudokuScreen]
class SudokuRoute extends _i6.PageRouteInfo<SudokuRouteArgs> {
  SudokuRoute({
    _i7.Key? key,
    required _i8.GameLevelEnum gameLevel,
    required bool isNewGame,
    List<_i6.PageRouteInfo>? children,
  }) : super(
         SudokuRoute.name,
         args: SudokuRouteArgs(
           key: key,
           gameLevel: gameLevel,
           isNewGame: isNewGame,
         ),
         initialChildren: children,
       );

  static const String name = 'SudokuRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SudokuRouteArgs>();
      return _i5.SudokuScreen(
        key: args.key,
        gameLevel: args.gameLevel,
        isNewGame: args.isNewGame,
      );
    },
  );
}

class SudokuRouteArgs {
  const SudokuRouteArgs({
    this.key,
    required this.gameLevel,
    required this.isNewGame,
  });

  final _i7.Key? key;

  final _i8.GameLevelEnum gameLevel;

  final bool isNewGame;

  @override
  String toString() {
    return 'SudokuRouteArgs{key: $key, gameLevel: $gameLevel, isNewGame: $isNewGame}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SudokuRouteArgs) return false;
    return key == other.key &&
        gameLevel == other.gameLevel &&
        isNewGame == other.isNewGame;
  }

  @override
  int get hashCode => key.hashCode ^ gameLevel.hashCode ^ isNewGame.hashCode;
}
