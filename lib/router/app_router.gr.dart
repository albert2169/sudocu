// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart' as _i6;
import 'package:sudocu/presentation/screens/main_menu_screen/main_menu_screen.dart'
    as _i1;
import 'package:sudocu/presentation/screens/spash_screen/splash_screen.dart'
    as _i2;
import 'package:sudocu/presentation/screens/sudocu_screen/sudocu_screen.dart'
    as _i3;

/// generated route for
/// [_i1.MainMenuScreen]
class MainMenuRoute extends _i4.PageRouteInfo<void> {
  const MainMenuRoute({List<_i4.PageRouteInfo>? children})
    : super(MainMenuRoute.name, initialChildren: children);

  static const String name = 'MainMenuRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i1.MainMenuScreen();
    },
  );
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i4.PageRouteInfo<void> {
  const SplashRoute({List<_i4.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      return const _i2.SplashScreen();
    },
  );
}

/// generated route for
/// [_i3.SudokuScreen]
class SudokuRoute extends _i4.PageRouteInfo<SudokuRouteArgs> {
  SudokuRoute({
    _i5.Key? key,
    required _i6.GameLevelEnum gameLevel,
    required bool isNewGame,
    List<_i4.PageRouteInfo>? children,
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

  static _i4.PageInfo page = _i4.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SudokuRouteArgs>();
      return _i3.SudokuScreen(
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

  final _i5.Key? key;

  final _i6.GameLevelEnum gameLevel;

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
