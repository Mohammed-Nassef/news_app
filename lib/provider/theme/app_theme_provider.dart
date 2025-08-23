import 'package:flutter/material.dart';

class AppThemeProvider extends ChangeNotifier {
  ThemeMode theme = ThemeMode.light;
  void chengeTheme(ThemeMode newTheme) {
    if (theme == newTheme) {
      return;
    } else {
      theme = newTheme;
    }
    notifyListeners();
  }
}
