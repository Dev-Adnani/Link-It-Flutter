// ignore_for_file: unnecessary_getters_setters

import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  bool _darktheme = true;
  bool get darkTheme => _darktheme;
  set darkTheme(bool value) {
    _darktheme = value;
  }

  ThemeNotifier();

  toggleTheme() {
    _darktheme = !_darktheme;
    notifyListeners();
  }
}
