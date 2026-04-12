

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_list/Models/const/ConstantSP.dart';

class Task {  // blueprint use this to create a objects

  String? taskId;
  String? title;
  String? detail;
  DateTime? DueDate;
  TimeOfDay? DueTime;
  bool isCompleted;


  Task({
    this.taskId,
    required this.title,
    this.detail = '',
    this.DueDate,
    this.DueTime,
    this.isCompleted = false,
  });

  // Model → Map (for INSERT / UPDATE )
  Map<String , dynamic> tomap(){

    String Date = DueDate!.toIso8601String();
    String Time = '${DueTime!.hour.toString().padLeft(2, '0')}:${DueTime!.minute.toString().padLeft(2, '0')}';
    int CompleteTask = 0;
     CompleteTask = isCompleted? 1 : 0;

    return {
      '${DBConstant.TASK_TITLE}' : title,
      '${DBConstant.TASK_DISC}' : detail,
      '${DBConstant.TASK_DUEDATE}' : Date,
      '${DBConstant.TASK_TIME}' : Time,
      '${DBConstant.TASK_isCompleted}' : CompleteTask,
    };
  }

  // Map → Model (for SELECT results)
  factory Task.FromMap(Map<String,dynamic> map){

    DateTime Date =DateTime.parse(map['${DBConstant.TASK_DUEDATE}']); // String ->DateTime
    final parts = (map['${DBConstant.TASK_TIME}']).split(':');
    TimeOfDay Time = TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    ); // String → TimeOfDay
    bool CompleteTask = map['${DBConstant.TASK_isCompleted}']== 0 ? false : true; // int -> boolean


    return Task(
      taskId : map['${DBConstant.TASK_ID}'].toString(),
      title  : map['${DBConstant.TASK_TITLE}'] ,
      detail : map['${DBConstant.TASK_DISC}'],
      DueDate: Date,
      DueTime: Time,
      isCompleted : CompleteTask,

    );
}


}