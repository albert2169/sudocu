import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class SudokuCell extends StatelessWidget {
  final Color? color; // Color of the circle inside the cell, null if empty
  final bool isSelected; // Indicates if the cell is currently selected

  const SudokuCell({
    super.key,
    this.color,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);
    return Container(
      width: 36, 
      height: 36, 
      decoration: BoxDecoration(
        color: colors.foregroundPrimary,
        border: Border.all(
          color: isSelected ? colors.gameColor1 : Colors.transparent,
          width: isSelected ? 3.0 : 1.0, 
        ),
        borderRadius: BorderRadius.circular(5), 
      ),
      child: Center(
        child: color != null
            ? Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              )
            : null, 
      ),
    );
  }
}