import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sudocu/presentation/custom_widgets/custom_app_bar.dart';
import 'package:sudocu/presentation/custom_widgets/custom_button.dart';
import 'package:sudocu/presentation/custom_widgets/game_level_enum.dart';
import 'package:sudocu/presentation/custom_widgets/huge_text_widget.dart';
import 'package:sudocu/presentation/screens/main_menu_screen/widget/game_level_text_button.dart';
import 'package:sudocu/router/app_router.gr.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

@RoutePage()
class MainMenuScreen extends StatefulWidget {
  const MainMenuScreen({super.key});

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  GameLevelEnum? selectedLevel = GameLevelEnum.medium;

  void _onLevelTap(GameLevelEnum level) {
    setState(() {
      selectedLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          left: GestureDetector(
            onTap: () {},
            child: Icon(Icons.settings, color: colors.secondary, size: 40),
          ),
          right: GestureDetector(
            onTap: () {},
            child: Icon(Icons.bar_chart, color: colors.secondary, size: 40),
          ),
        ),
        backgroundColor: colors.backgroundPrimary,
        body: Padding(
          padding: const EdgeInsets.only(top: 70, left: 61, right: 61),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Center(child: HugeTextWidget(text: 'SLUDOKU')),
              const SizedBox(height: 30),
              for (final level in GameLevelEnum.values) ...[
                Center(
                  child: GameLevelTextButton(
                    onTap: () => _onLevelTap(level),
                    isActive: selectedLevel == level,
                    levelText: level.name,
                  ),
                ),
                const SizedBox(height: 25),
              ],
              CustomButton(
                color: colors.backgroundSecondary,
                title: 'NEW GAME',
                onTap: () {
                  context.router.push(SudokuRoute());
                },
              ),
              const SizedBox(height: 25),
              CustomButton(color: colors.secondary, title: 'CONTINUE', onTap: () {}),
              const SizedBox(height: 25),
              Center(
                child: GameLevelTextButton(onTap: () {}, isActive: false, levelText: 'RULES'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
