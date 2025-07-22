import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart';
import 'package:sudocu/presentation/custom_widgets/load_state_enum.dart';

class SudocuState extends Equatable {
  final List<List<Color?>> currentBoard;
  final String time;
  final GameLevelEnum level;
  final LoadState loadState;
  final bool isPaused;
  final bool isFinished;
  final bool isUserWin;

  const SudocuState({
    required this.currentBoard,
    required this.time,
    required this.level,
    required this.loadState,
    required this.isPaused,
    required this.isFinished,
    required this.isUserWin,
  });

  SudocuState copyWith({
    List<List<Color?>>? currentBoard,
    String? time,
    GameLevelEnum? level,
    LoadState? loadState,
    bool? isPaused,
    bool? isFinished,
    bool? isUserWin,
  }) {
    return SudocuState(
      currentBoard: currentBoard ?? this.currentBoard,
      time: time ?? this.time,
      level: level ?? this.level,
      loadState: loadState ?? this.loadState,
      isPaused: isPaused ?? this.isPaused,
      isFinished: isFinished ?? this.isFinished,
      isUserWin: isUserWin ?? this.isUserWin,
    );
  }

  @override
  List<Object?> get props => [
    _flattenBoard(currentBoard),
    time,
    level,
    loadState,
    isPaused,
    isFinished,
    isUserWin
  ];

  static List<Color?> _flattenBoard(List<List<Color?>> board) =>
      board.expand((row) => row).toList();

  @override
  String toString() {
    return 'SudocuState(time: $time, level: $level, loadState: $loadState, isPaused: $isPaused)';
  }
}
