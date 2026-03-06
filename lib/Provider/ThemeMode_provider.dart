

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThememodeProvider extends ChangeNotifier{

/// variable
  ThemeMode _themeMode = ThemeMode.light;
 /// getter
  ThemeMode modeGetter() => _themeMode;
/// method
  void ThemeModeToggale(){
      _themeMode = _themeMode == ThemeMode.light? ThemeMode.dark:ThemeMode.light;
      notifyListeners();
  }

}