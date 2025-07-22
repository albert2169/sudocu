import 'dart:ui';

import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart';

abstract class SudocuEvent {}

class FetchInitialBoardEvent extends SudocuEvent {
  final GameLevelEnum gameLevel;
  final bool isNewGame;
  FetchInitialBoardEvent({required this.gameLevel, required this.isNewGame});
}

class TickTimerEvent extends SudocuEvent {}

class TickTimerStopEvent extends SudocuEvent {}

class TimerTicked extends SudocuEvent {}

class ClearBoardEvent extends SudocuEvent {}

class SubmitSudocuEvent extends SudocuEvent {
  final List<List<Color?>> board;
  SubmitSudocuEvent({required this.board});
}
