

import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/Models/const/ConstantSP.dart';

class DBHelper {

  DBHelper._(); // Private Constructor
  static DBHelper DBInstance = DBHelper._();

  Database? _myDB;

  Future<Database> getDB() async {

    _myDB ??= await openDB();
    return _myDB!;

  }

  Future<Database?> openDB() async {

    String path = await getDatabasesPath();
    String DBPath = join( path, "TasksDB.db" );

    return openDatabase(
        DBPath,
        version: 1,
        onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db , int version) async{

      String TableQuery = " create table ${DBConstant.TABLE_NAME}(${DBConstant.TASK_ID} integer primary key autoincrement,${DBConstant.TASK_TITLE} text,${DBConstant.TASK_DISC} text,${DBConstant.TASK_DUEDATE} text,${DBConstant.TASK_TIMER} text,${DBConstant.TASK_isCompleted} text )";
      await db.execute(TableQuery);


  }


}