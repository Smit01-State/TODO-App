

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list/Models/const/ConstantSP.dart';

 


class ThememodeProvider extends ChangeNotifier{

/// variable
  ThemeMode _themeMode = ThemeMode.system;
  Color _color = Colors.blue;
 /// getter
  ThemeMode get getMode => _themeMode;

  Color get ThemeColor =>_color;

/// method

   ThememodeProvider(bool isDark,Color color ){

          _color = color;
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
        shrf.setBool(Constsp.THEMEMODE_KEY, true);
      }else{
        _themeMode = ThemeMode.light;
        shrf.setBool(Constsp.THEMEMODE_KEY, false);
      }
      notifyListeners();
  }

  Future<void> ColorChange(Color color) async {
     SharedPreferences shrf = await SharedPreferences.getInstance();
     shrf.setInt(Constsp.THEMECOLOR_KEY, color.value);
    _color = color;
    notifyListeners();
  }



}