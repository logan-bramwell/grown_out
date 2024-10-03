import 'package:flutter/material.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  final darkTheme = ThemeData();

  final lightTheme = ThemeData();

  changeTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  init(){
    notifyListeners();
  }

}
