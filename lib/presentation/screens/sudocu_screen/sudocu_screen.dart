import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sudocu/presentation/custom_widgets/custom_app_bar.dart';
import 'package:sudocu/presentation/custom_widgets/custom_button.dart';
import 'package:sudocu/presentation/custom_widgets/custom_loading_widget.dart';
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart';
import 'package:sudocu/presentation/custom_widgets/load_state_enum.dart';
import 'package:sudocu/presentation/custom_widgets/show_dialog_function.dart';
import 'package:sudocu/presentation/screens/sudocu_screen/widgets/input_color_dot.dart';
import 'package:sudocu/presentation/screens/sudocu_screen/widgets/sudoku_cell.dart';
import 'package:sudocu/router/app_router.gr.dart';
import 'package:sudocu/state/sudocu_bloc.dart';
import 'package:sudocu/state/sudocu_event.dart';
import 'package:sudocu/state/sudocu_state.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

@RoutePage()
class SudokuScreen extends StatefulWidget {
  final GameLevelEnum gameLevel;
  final bool isNewGame;
  const SudokuScreen({super.key, required this.gameLevel, required this.isNewGame});

  @override
  State<SudokuScreen> createState() => _SudokuScreenState();
}

class _SudokuScreenState extends State<SudokuScreen> {
  late List<List<Color?>> _board;
  int? _selectedRow;
  int? _selectedCol;

  @override
  void initState() {
    super.initState();
    context.read<SudocuBloc>().add(
      FetchInitialBoardEvent(gameLevel: widget.gameLevel, isNewGame: widget.isNewGame),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedRow = 0;
    _selectedCol = 6;
  }

  void _onCellTap(int row, int col, bool isPaused) {
    if (isPaused) {
      return;
    }
    setState(() {
      if (_selectedRow == row && _selectedCol == col) {
        _selectedRow = null;
        _selectedCol = null;
      } else {
        _selectedRow = row;
        _selectedCol = col;
      }
    });
  }

  void _onInputColorTap(Color color, bool isPaused) {
    if (isPaused) {
      return;
    }
    if (_selectedRow != null && _selectedCol != null) {
      setState(() {
        _board[_selectedRow!][_selectedCol!] = color;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);
    final List<Color> inputColors = [
      colors.gameColor1,
      colors.gameColor2,
      colors.gameColor3,
      colors.gameColor4,
      colors.gameColor5,
      colors.gameColor6,
      colors.gameColor7,
      colors.gameColor8,
      colors.gameColor9,
    ];

    return BlocConsumer<SudocuBloc, SudocuState>(
      listener: (context, state) {
        if (state.isFinished) {
          if (state.isUserWin) {
            showCustomDialog(
              context: context,
              title: 'Congratulations!',
              message: 'You’ve successfully completed the Sudoku puzzle. Great job!',
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.router.pop();
                  },
                  child: Text('Try Again'),
                ),
              ],
            );
          } else {
            showCustomDialog(
              context: context,
              title: 'Puzzle Incomplete',
              message: 'You didn’t solve the puzzle correctly in time. Don’t give up — try again!',
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                    context.router.pop();
                  },
                  child: Text(state.isUserWin ? 'Continue' : 'Try Again'),
                ),
              ],
            );
          }
        }
      },
      builder: (context, state) {
        if (state.loadState == LoadState.loading) {
          return Container(
            color: colors.backgroundPrimary,
            child: Center(child: CustomLoadingWidget()),
          );
        }
        _board = [...state.currentBoard];
        final isCompleted = _isBoardCompletelyFilled();
        return Scaffold(
          appBar: CustomAppBar(
            right: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(40),
                onTap: () {
                  context.read<SudocuBloc>().add(TickTimerStopEvent());
                },
                child: GestureDetector(
                  onTap: isCompleted
                      ? () {
                          context.read<SudocuBloc>().add(SubmitSudocuEvent(board: _board));
                        }
                      : () {
                          showCustomDialog(
                            context: context,
                            title: 'Puzzle Incomplete',
                            message: 'Fields cannot be empty before submiting',
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context, rootNavigator: true).pop();
                                },
                                child: Text('Continue'),
                              ),
                            ],
                          );
                        },
                  child: Text(
                    'SUBMIT',
                    style: TextStyle(
                      color: isCompleted ? colors.gameColor9 : colors.secondary,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
            left: state.isPaused
                ? Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        context.read<SudocuBloc>().add(TickTimerEvent());
                      },
                      child: Icon(Icons.play_arrow, size: 40, color: colors.secondary),
                    ),
                  )
                : Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {
                        context.read<SudocuBloc>().add(TickTimerStopEvent());
                      },
                      child: Icon(Icons.pause, size: 40, color: colors.secondary),
                    ),
                  ),
            title: Text(
              state.time,
              style: TextStyle(color: colors.primary, fontSize: 24, fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: colors.backgroundPrimary,
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 40),
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1.1,
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 9,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemCount: 81,
                    itemBuilder: (context, index) {
                      final row = index ~/ 9;
                      final col = index % 9;
                      final cellColor = _board[row][col];
                      final isSelected = (_selectedRow == row && _selectedCol == col);
                      return GestureDetector(
                        onTap: () => _onCellTap(row, col, state.isPaused),
                        child: SudokuCell(color: cellColor, isSelected: isSelected),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    color: colors.backgroundPrimary,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      mainAxisSize: MainAxisSize.min,
                      children: inputColors.map((color) {
                        return Expanded(
                          child: InputColorDot(
                            color: color,
                            onTap: () => _onInputColorTap(color, state.isPaused),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 150,
                      child: CustomButton(
                        onTap: () {
                          context.read<SudocuBloc>().add(ClearBoardEvent());
                        },
                        title: 'CLEAR',
                        color: colors.secondary,
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: CustomButton(
                        onTap: () {
                          context.router.push(RulesRoute());
                        },
                        title: 'RULES',
                        color: colors.secondary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isBoardCompletelyFilled() {
    for (var row in _board) {
      for (var cell in row) {
        if (cell == null) return false;
      }
    }
    return true;
  }
}
