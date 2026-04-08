

import 'dart:async';

import 'package:flutter/material.dart';

class Task {  // blueprint use this to create a objects

  String? title;
  String? detail;
  DateTime? DueDate;
  TimeOfDay? DueTime;
  bool isCompleted;


  Task({

    required this.title,
    this.detail = '',
    this.DueDate,
    this.DueTime,
    this.isCompleted = false,
  });

  // Model → Map (for INSERT / UPDATE)
  Map<String , dynamic> tomap(){
    return {
      'title' : title,
      'detail' : detail,
      'DueDate' : DueDate,
      'DueTime' : DueTime,
      'isCompleted' : isCompleted,
    };
  }

  // Map → Model (for SELECT results)
  factory Task.FromMap(Map<String,dynamic> map){

    return Task(

      title : map['title'] as String,
      detail :map['detail'],
      DueDate:map['DueDate'],
      DueTime:map['DueTime'],
      isCompleted : map['isCompleted'],

    );
}


}