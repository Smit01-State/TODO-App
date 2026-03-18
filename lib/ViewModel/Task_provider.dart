

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class TaskProvider extends ChangeNotifier{
///Lists
  List<Task> _tasks  = [];
  List<Task> _Historytasks  = [];

/// Task getter
  List<Task> get Tasks=> _tasks;
  List<Task> get HistoryTasks=> _Historytasks;

/// methods
  void AddTask(Task task){
      _tasks.add(task);
      notifyListeners();
  }
  void AddHistoryTask(Task task){
    _Historytasks.add(task);
    notifyListeners();
  }
  void toggleTask(int index){
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      notifyListeners();
  }

}