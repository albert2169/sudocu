// import 'package:flutter/material.dart';
// import 'package:sudocu/theme/colors/sudocu_color_theme.dart';
// import 'package:sudocu/theme/colors/sudocu_color_theme_extension.dart';

// class SudocuThemeProvider extends ChangeNotifier {
//   bool _isDarkMode = true;

//   SudocuColorThemeExtension get theme =>
//       _isDarkMode ? SudocuColorTheme.dark() : SudocuColorTheme.light();

//   bool get isDarkMode => _isDarkMode;

//   void toggleTheme() {
//     _isDarkMode = !_isDarkMode;
//     notifyListeners();
//   }

//   void setDarkMode(bool isDark) {
//     _isDarkMode = isDark;
//     notifyListeners();
//   }
// }