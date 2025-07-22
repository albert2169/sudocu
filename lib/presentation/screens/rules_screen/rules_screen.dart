import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/custom_app_bar.dart';
import 'package:sudocu/presentation/custom_widgets/huge_text_widget.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme_extension.dart';

@RoutePage()
class RulesScreen extends StatelessWidget {
  const RulesScreen({super.key});

  Widget _buildBulletPoint(String text, SudocuColorThemeExtension colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 5.0,
            height: 5.0,
            margin: const EdgeInsets.only(top: 6.0, right: 8.0),
            decoration: BoxDecoration(color: Colors.black87, shape: BoxShape.circle),
          ),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 16, color: colors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedInstruction(String title, String content, SudocuColorThemeExtension colors) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: colors.primary),
          ),
          const SizedBox(height: 4),
          Text(content, style: TextStyle(fontSize: 16, color: colors.primary)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    return Scaffold(
      appBar: CustomAppBar(
        left: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(40),
            onTap: () {
              context.router.pop();
            },
            child: Icon(Icons.arrow_back, size: 40, color: colors.secondary),
          ),
        ),
      ),
      backgroundColor: colors.backgroundPrimary,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: HugeTextWidget(text: 'RULES')),
              const SizedBox(height: 20),
              Text(
                'Objective:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.primary),
              ),
              const SizedBox(height: 8),
              Text(
                'Fill the entire 9x9 grid using nine different colored balls so that:',
                style: TextStyle(fontSize: 16, color: colors.primary),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBulletPoint('Each row contains all 9 colors (no repeats).', colors),
                  _buildBulletPoint('Each column contains all 9 colors (no repeats).', colors),
                  _buildBulletPoint(
                    'Each 3x3 square (subgrid) contains all 9 colors (no repeats).',
                    colors,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                "This is just like classic Sudoku, but instead of numbers, you're using colors.",
                style: TextStyle(fontSize: 16, color: colors.primary),
              ),
              const SizedBox(height: 24),
              Text(
                'Gameplay Instructions:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colors.primary),
              ),
              const SizedBox(height: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildNumberedInstruction(
                    '1. Tap a Cell:',
                    'Tap any empty cell in the grid to select it.',
                    colors,
                  ),
                  _buildNumberedInstruction(
                    '2. Choose a Color:',
                    'Pick one of the 9 color balls below the grid to place it into the selected cell.',
                    colors,
                  ),
                  _buildNumberedInstruction(
                    '3. Clear a Cell:',
                    'If you make a mistake, tap the "Clear" button to remove the color from the selected cell.',
                    colors,
                  ),
                  _buildNumberedInstruction(
                    '4. Pause the Game:',
                    'Tap the pause button to stop the timer and take a break.',
                    colors,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
