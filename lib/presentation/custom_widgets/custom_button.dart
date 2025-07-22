import 'package:flutter/material.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color? color;
  const CustomButton({super.key, required this.onTap, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(200)),
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: colors.primary, fontSize: 28, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
