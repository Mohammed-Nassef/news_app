import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  int page = 1;
  void changePage(int newPage) {
    page = newPage;
    notifyListeners();
  }
}
