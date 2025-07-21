import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class HugeTextWidget extends StatelessWidget {
  final String text;
  const HugeTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        
        color: colors.primary,
        fontSize: 40,
        fontWeight: FontWeight.w600,
        letterSpacing: 2.0,
      ),
    );
  }
}
