import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/Services/Local/DBHelper.dart';

import '../Models/task.dart';

class TaskProvider extends ChangeNotifier {
  /// initiator
  DBHelper DBinst = DBHelper.DBInstance;

  ///Lists
  List<Task> _tasks = [];
  List<Task> _Historytasks = [];

  /// Task getter
  List<Task> get Tasks => _tasks;

  List<Task> get HistoryTasks => _Historytasks;

  /// methods
  /// for _task methods
  void ShowDBTask() async {
    Database DB = await DBinst.getDB();
    Future<List<Task>> DBTask = DBinst.select(DB, 0);
    _tasks = await DBTask;
    notifyListeners();
  }

  Future<void> AddTask(Task task) async {
    Database DB = await DBinst.getDB();

    DBinst.Insert(DB, task.tomap());
    Future<List<Task>> newTasks = DBinst.select(
      DB,
      0,
    ); // in place of bit 0 because the new task added ans shown
    _tasks = await newTasks;
    notifyListeners();
  }

  Future<void> toggleTask(int index) async {
    _tasks[index].isCompleted = !_tasks[index].isCompleted;

    final String id =
        _tasks[index].taskId!; // store the id for counter DB delay
    int Cheker = _tasks[index].isCompleted
        ? 1
        : 0; // change boolean to 0 and 1 to update DB

    print("index :${index}"); // debugger in terminal
    print("list length :${_tasks.length}"); // debugger in terminal

    Database DB = await DBinst.getDB();
    DBinst.UpdateTask(DB, id, Cheker);

    notifyListeners();
  }

  Future<void> RemoveTask(int index) async {
    // await Future.delayed(Duration(milliseconds: 200));
    _tasks.removeAt(index);
    notifyListeners();
  }

  /// for _Historytasks methods
  ///
  void ShowDBHistoryTask() async {
    Database DB = await DBinst.getDB();
    Future<List<Task>> DBTask = DBinst.select(DB, 1);
    _Historytasks = await DBTask;
    notifyListeners();
  }

  void AddHistoryTask(Task task) {
    _Historytasks.add(task);
    notifyListeners();
  }

  Future<void> RemoveHistoryTask(int index) async {
    _Historytasks.removeAt(index);
    notifyListeners();
  }

  Future<void> RemoveDBTask(int index) async {
    Database DB = await DBinst.getDB();
    final String id = _Historytasks[index].taskId!;
    DBinst.RemoveTask(DB, id);
    _Historytasks.removeAt(index);
    notifyListeners();
  }

  Future<void> HistorytoggleTask(int index) async {
    _Historytasks[index].isCompleted = !_Historytasks[index].isCompleted;

    final String id =
        _Historytasks[index].taskId!; // store the id for counter DB delay
    int Cheker = _Historytasks[index].isCompleted ? 1 : 0;

    Database DB = await DBinst.getDB();
    DBinst.UpdateTask(DB, id, Cheker);

    notifyListeners();
  }
}
