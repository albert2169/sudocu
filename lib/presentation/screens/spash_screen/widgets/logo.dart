import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/huge_text_widget.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    const double dotSize = 30.0;
    const double spacing = 10.0; 

    return SizedBox(
      height: 200, 
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center, 
              children: [
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: spacing), 
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: colors.backgroundTertiary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: spacing), 
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: colors.backgroundTertiary,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: spacing), 
                Container(
                  width: dotSize,
                  height: dotSize,
                  decoration: BoxDecoration(
                    color: colors.backgroundSecondary,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10), 
          HugeTextWidget(text: 'SLUDOKU')
          ],
        ),
      ),
    );
  }
}