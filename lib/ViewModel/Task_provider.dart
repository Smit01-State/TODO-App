

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
  /// for _task methods
  void AddTask(Task task){
      _tasks.add(task);
      notifyListeners();
  }
  void toggleTask(int index){
    _tasks[index].isCompleted = !_tasks[index].isCompleted;
    notifyListeners();
  }
  void RemoveTask(int index){
    _tasks.removeAt(index);
    notifyListeners();
  }
  /// for _Historytasks methods
  void AddHistoryTask(Task task){
    _Historytasks.add(task);
    notifyListeners();
  }
  void RemoveHistoryTask(int index){
    _Historytasks.removeAt(index);
    notifyListeners();
  }
  void HistorytoggleTask(int index){
    _Historytasks[index].isCompleted = !_Historytasks[index].isCompleted;
    notifyListeners();
  }


}