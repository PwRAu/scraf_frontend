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

class ChangeWidth extends ChangeNotifier {
  double pSize;
  ChangeWidth() {
    pSize = 224;
  }

  void swichChangeWidth() {
    if (pSize == 224)
      pSize = 96;
    else
      pSize = 224;
    notifyListeners();
  }
}
