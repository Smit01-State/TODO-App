import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/Models/task.dart';

import '../../Models/const/Constants.dart';

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
    String DBPath = join(path, "TasksDB.db");

    return openDatabase(DBPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    String TableQuery =
        " create table if not exists ${DBConstant.TABLE_NAME}(${DBConstant.TASK_ID} integer primary key autoincrement,${DBConstant.TASK_TITLE} text,${DBConstant.TASK_DISC} text,${DBConstant.TASK_DUEDATE} text,${DBConstant.TASK_TIME} text,${DBConstant.TASK_isCompleted} boolean not null default 1 )";
    await db.execute(TableQuery);
  }

  void Insert(Database db, Map<String, dynamic> map) {
    /*String TableQuery = 'insert into ${DBConstant.TABLE_NAME}'
        '(${DBConstant.TASK_TITLE},${DBConstant.TASK_DISC},${DBConstant.TASK_DUEDATE},${DBConstant.TASK_TIME},${DBConstant.TASK_isCompleted})'
        'value(${map['title']},${map['detail']},${map['DueDate']},${map['DueTime']},${map['isCompleted']})';
    */
    db.insert(DBConstant.TABLE_NAME, map);
  }

  Future<List<Task>> select(Database db, bit) async {
    // bit  0 or 1

    final List<Map<String, dynamic>> maps = await db.query(
      DBConstant.TABLE_NAME,
      where: "Tasks_isCompleted = ? ",
      whereArgs: [bit],
    );
    return maps.map((map) => Task.FromMap(map)).toList();
  }

  void UpdateTask(Database db, id, value) {
    db.update(
      DBConstant.TABLE_NAME,
      {"Tasks_isCompleted": value},
      where: 'Tasks_id = ? ',
      whereArgs: [id],
    );
  }

  void RemoveTask(Database db, id) {
    db.delete(DBConstant.TABLE_NAME, where: 'Tasks_id = ? ', whereArgs: [id]);
  }
}
