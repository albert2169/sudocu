import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class GameLevelTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final bool isActive;
  final String levelText;
  const GameLevelTextButton({
    super.key,
    required this.onTap,
    required this.isActive,
    required this.levelText,
  });

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Text(
        levelText,
        style: TextStyle(
          color: isActive ? colors.primary : colors.secondary,
          fontSize: 28,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
