import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart';
import 'package:sudocu/presentation/custom_widgets/load_state_enum.dart';
import 'package:sudocu/state/sudocu_event.dart';
import 'package:sudocu/state/sudocu_state.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class SudocuBloc extends Bloc<SudocuEvent, SudocuState> {
  final BuildContext context;
  Timer? _timer;
  int _remainingSeconds = 0;

  SudocuBloc({required this.context})
    : super(
        SudocuState(
          isUserWin: false,
          loadState: LoadState.loading,
          currentBoard: [],
          time: '',
          level: GameLevelEnum.medium,
          isPaused: false,
          isFinished: false,
        ),
      ) {
    on<FetchInitialBoardEvent>(_handleFetchInitialBoardEvent);
    on<TickTimerEvent>(_handleTickTimerEvent);
    on<TimerTicked>(_handleTimerTicked);
    on<TickTimerStopEvent>(_handleTickTimerStopEvent);
    on<ClearBoardEvent>(_handleClearBoardEvent);
    on<SubmitSudocuEvent>(_handleSubmitSudocuEvent);
  }

  void _handleFetchInitialBoardEvent(
    FetchInitialBoardEvent event,
    Emitter<SudocuState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    await Future.delayed(const Duration(seconds: 2));

    if (!event.isNewGame) {
      emit(state.copyWith(loadState: LoadState.loaded));
    }

    final board = _initializeBoard();
    final levelMinutes = event.gameLevel.time;

    _remainingSeconds = (levelMinutes * 60).toInt();

    emit(
      state.copyWith(
        currentBoard: board,
        level: event.gameLevel,
        isPaused: false,
        isFinished: false,
        loadState: LoadState.loaded,
        time: _formatTime(_remainingSeconds),
      ),
    );

    add(TickTimerEvent());
  }

  void _handleTickTimerEvent(TickTimerEvent event, Emitter<SudocuState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isPaused: false));

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state.isPaused) {
        return;
      }
      add(TimerTicked());
    });
  }

  void _handleTickTimerStopEvent(TickTimerStopEvent event, Emitter<SudocuState> emit) {
    _timer?.cancel();
    emit(state.copyWith(isPaused: true));
  }

  void _handleTimerTicked(TimerTicked event, Emitter<SudocuState> emit) {
    if (_remainingSeconds <= 0) {
      _timer?.cancel();
      add(SubmitSudocuEvent(board: _initializeBoard()));
    }

    _remainingSeconds--;
    emit(state.copyWith(time: _formatTime(_remainingSeconds)));
  }

  void _handleClearBoardEvent(ClearBoardEvent event, Emitter<SudocuState> emit) {
    emit(state.copyWith(currentBoard: _initializeBoard()));
  }

  void _handleSubmitSudocuEvent(SubmitSudocuEvent event, Emitter<SudocuState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));
    await Future.delayed(const Duration(seconds: 2));
    bool isUserWin = false;
    if (_isSudokuSolved(event.board)) {
      isUserWin = true;
    }
    emit(
      state.copyWith(
        currentBoard: _initializeBoard(),
        isFinished: true,
        isUserWin: isUserWin,
        loadState: LoadState.loaded,
      ),
    );
    emit(state.copyWith(isFinished: false, isUserWin: false));
  }

  String _formatTime(int totalSeconds) {
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }

  List<List<Color?>> _initializeBoard() {
    final colors = SudocuColorTheme.of(context);
    return List.generate(9, (_) => List.generate(9, (_) => null))
      ..[0][0] = colors.gameColor9
      ..[0][1] = colors.gameColor6
      ..[0][4] = colors.gameColor5
      ..[2][2] = colors.gameColor9
      ..[2][5] = colors.gameColor7
      ..[2][8] = colors.gameColor8
      ..[3][3] = colors.gameColor8
      ..[4][7] = colors.gameColor2
      ..[5][2] = colors.gameColor3
      ..[6][0] = colors.gameColor8
      ..[6][4] = colors.gameColor6
      ..[6][5] = colors.gameColor1
      ..[7][2] = colors.gameColor4
      ..[8][5] = colors.gameColor8;
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }

  bool _isSudokuSolved(List<List<Color?>> board) {
    Set<Color?> extractBox(int startRow, int startCol) {
      final box = <Color?>{};
      for (int i = 0; i < 3; i++) {
        for (int j = 0; j < 3; j++) {
          box.add(board[startRow + i][startCol + j]);
        }
      }
      return box;
    }

    for (int i = 0; i < 9; i++) {
      final rowSet = <Color?>{};
      final colSet = <Color?>{};
      for (int j = 0; j < 9; j++) {
        final rowVal = board[i][j];
        final colVal = board[j][i];
        if (rowVal == null || colVal == null) return false;

        if (rowSet.contains(rowVal) || colSet.contains(colVal)) {
          return false;
        }
        rowSet.add(rowVal);
        colSet.add(colVal);
      }
    }

    for (int row = 0; row < 9; row += 3) {
      for (int col = 0; col < 9; col += 3) {
        final box = extractBox(row, col);
        if (box.length != 9 || box.contains(null)) return false;
      }
    }

    return true;
  }
}
