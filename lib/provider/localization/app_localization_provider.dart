import 'package:flutter/material.dart';

class AppLocalizationProvider extends ChangeNotifier {
  String language = 'en';
  void changeLanguage(String newLanguage) {
    if (language == newLanguage) {
      return;
    } else {
      language = newLanguage;
    }
    notifyListeners();
  }
}
