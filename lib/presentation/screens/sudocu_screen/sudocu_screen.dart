import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/custom_button.dart';
import 'package:sudocu/presentation/screens/sudocu_screen/widgets/input_color_dot.dart';
import 'package:sudocu/presentation/screens/sudocu_screen/widgets/sudoku_cell.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

@RoutePage()
class SudokuScreen extends StatefulWidget {
  const SudokuScreen({super.key});

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
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initializeBoard();
  }

  void _initializeBoard() {
    final colors = SudocuColorTheme.of(context);
    _board = List.generate(9, (_) => List.generate(9, (_) => null));

    _board[0][0] = colors.gameColor9;
    _board[0][1] = colors.gameColor6;
    _board[0][4] = colors.gameColor5;
    _board[2][2] = colors.gameColor9;
    _board[2][5] = colors.gameColor7;
    _board[2][8] = colors.gameColor8;
    _board[3][3] = colors.gameColor8;
    _board[4][7] = colors.gameColor2;
    _board[5][2] = colors.gameColor3;
    _board[6][0] = colors.gameColor8;
    _board[6][4] = colors.gameColor6;
    _board[6][5] = colors.gameColor1;
    _board[7][2] = colors.gameColor4;
    _board[8][5] = colors.gameColor8;

    _selectedRow = 0;
    _selectedCol = 6;
  }

  void _onCellTap(int row, int col) {
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

  void _onInputColorTap(Color color) {
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

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 80),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: GridView.builder(
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
                    onTap: () => _onCellTap(row, col),
                    child: SudokuCell(color: cellColor, isSelected: isSelected),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 60),
              child: Container(
                color: colors.backgroundPrimary,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: inputColors.map((color) {
                    return Expanded(
                      child: InputColorDot(color: color, onTap: () => _onInputColorTap(color)),
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
                      setState(() {
                        _initializeBoard();
                      });
                    },
                    title: 'CLEAR',
                    color: colors.secondary,
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: CustomButton(onTap: () {}, title: 'RULES', color: colors.secondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
