

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThememodeProvider extends ChangeNotifier{

/// variable
  ThemeMode _themeMode = ThemeMode.light;
  Color _color = Colors.brown;
 /// getter
  ThemeMode modeGetter() => _themeMode;
  Color ColorGettter()=>_color;
/// method
  void ThemeModeToggale(){
      _themeMode = _themeMode == ThemeMode.light? ThemeMode.dark:ThemeMode.light;
      notifyListeners();
  }
  void ColorChange(Color color){
    _color = color;
    notifyListeners();
  }



}