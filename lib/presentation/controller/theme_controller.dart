import 'package:flutter/material.dart';

class ThemeController extends ChangeNotifier {
  bool isDarkTheme = false;

  void changeTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
