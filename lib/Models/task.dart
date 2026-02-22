

class Task { // blueprint use this to create a objects

  String? title;
  String? detail;
  DateTime? DueDate;
  bool? isCompleted;

  Task({
    required this.title,
    this.detail = '',
    this.DueDate,
    this.isCompleted = false
  });

}