import 'const/Constants.dart';

class Task {
  // blueprint use this to create a objects

  String? taskId;
  String? title;
  String? detail;
  DateTime? DueDate;

  bool isCompleted;

  Task({
    this.taskId,
    required this.title,
    this.detail = '',
    this.DueDate,

    this.isCompleted = false,
  });

  // Model → Map (for INSERT / UPDATE )
  Map<String, dynamic> tomap() {
    String Date = DueDate!.toIso8601String();

    int CompleteTask = 0;
    CompleteTask = isCompleted ? 1 : 0;

    return {
      '${DBConstant.TASK_TITLE}': title,
      '${DBConstant.TASK_DISC}': detail,
      '${DBConstant.TASK_DUEDATE}': Date,
      '${DBConstant.TASK_isCompleted}': CompleteTask,
    };
  }

  // Map → Model (for SELECT results)
  factory Task.FromMap(Map<String, dynamic> map) {
    DateTime Date = DateTime.parse(
      map['${DBConstant.TASK_DUEDATE}'],
    ); // String ->DateTime
    bool CompleteTask = map['${DBConstant.TASK_isCompleted}'] == 0
        ? false
        : true; // int -> boolean

    return Task(
      taskId: map['${DBConstant.TASK_ID}'].toString(),
      title: map['${DBConstant.TASK_TITLE}'],
      detail: map['${DBConstant.TASK_DISC}'],
      DueDate: Date,

      isCompleted: CompleteTask,
    );
  }
}
