import 'package:flutter/material.dart';

class Validator {
  static DateTime CurentDate = DateTime.now();
  static TimeOfDay CurentTime = TimeOfDay.now();

  static String? TitleValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter a Title";
    }
    return null;
  }

  static String? TimeValidate(String? value) {
    if (value == null || value.isEmpty) {
      return "Please Enter a Title";
    }
    return null;
  }
}
