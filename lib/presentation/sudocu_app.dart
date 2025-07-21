import 'package:flutter/material.dart';
import 'package:sudocu/router/app_router.dart';
import 'package:sudocu/theme/colors/sudocu_color_theme.dart';

class SudocuApp extends StatelessWidget {
  final _appRouter = AppRouter();

  SudocuApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      title: 'Sudocu',
      theme: ThemeData(
        extensions: [SudocuColorTheme.light()]
      ),
    );
  }
}