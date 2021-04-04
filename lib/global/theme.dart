import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'config.dart';

class MyTheme extends ChangeNotifier {
  static bool _isDark = false;

  MyTheme() {
    if (box.containsKey('theme')) {
      _isDark = box.get('theme');
    } else {
      box.put('theme', _isDark);
    }
  }

  ThemeMode currentTheme() {
    return _isDark ? ThemeMode.dark : ThemeMode.light;
  }

  void switchTheme() {
    _isDark = !_isDark;
    box.put('theme', _isDark);
    notifyListeners();
  }
}
