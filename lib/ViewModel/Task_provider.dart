

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../Models/task.dart';

class TaskProvider extends ChangeNotifier{

  List<Task> _tasks  = [];

  List<Task> TaskGetter()=> _tasks;

  void AddTask(Task task){
      _tasks.add(task);
      notifyListeners();
  }

  void toggleTask(int index){
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
      notifyListeners();
  }

}