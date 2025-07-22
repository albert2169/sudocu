import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sudocu/presentation/screens/spash_screen/widgets/logo.dart';
import 'package:sudocu/router/app_router.gr.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = SudocuColorTheme.of(context);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(seconds: 2));

      if (context.mounted) {
        context.router.replace(MainMenuRoute());
      }
    });

    return Scaffold(
      backgroundColor: colors.backgroundPrimary,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 120),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: const [Logo()]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text(
          'Privacy and Terms',
          textAlign: TextAlign.center,
          style: TextStyle(color: colors.secondary, fontSize: 20),
        ),
      ),
    );
  }
}
