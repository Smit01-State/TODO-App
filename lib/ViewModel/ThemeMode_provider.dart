

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/Models/const/ConstatSP.dart';
 


class ThememodeProvider extends ChangeNotifier{

/// variable
  ThemeMode _themeMode = ThemeMode.light;
  Color _color = Colors.brown;
 /// getter
  ThemeMode get getMode => _themeMode;
  Color ColorGettter()=>_color;

/// method

   ThememodeProvider(bool isDark){
        if(isDark){
          _themeMode=ThemeMode.dark;
        }
        else{
          _themeMode = ThemeMode.light;
        }

  }
  Future<void> ThemeModeToggale() async {
    SharedPreferences shrf = await SharedPreferences.getInstance();
     // _themeMode = _themeMode == ThemeMode.light? ThemeMode.dark:ThemeMode.light;
      if(_themeMode == ThemeMode.light){
        _themeMode = ThemeMode.dark;
        shrf.setBool(Constatsp.THEMEMODE_KEY, true);
      }else{
        _themeMode = ThemeMode.light;
        shrf.setBool(Constatsp.THEMEMODE_KEY, false);
      }
      notifyListeners();
  }
  void ColorChange(Color color){
    _color = color;
    notifyListeners();
  }



}