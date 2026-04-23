import 'package:flutter/material.dart';
import 'package:todo_list/Models/task.dart';

import '../ViewModel/Task_provider.dart';

class TodoAdd extends StatefulWidget {
  final TaskProvider taskProvider;
  final Task? existingTask;

  TodoAdd({super.key, required this.taskProvider, this.existingTask});

  @override
  State<TodoAdd> createState() => _TodoaddState();
}

class _TodoaddState extends State<TodoAdd> {
  var _todoTitleControler = TextEditingController();
  var _todoDetailControler = TextEditingController();
  var _todoDateControler = TextEditingController();
  var _todoTimeControler = TextEditingController();

  late DateTime SelectedDate;
  late TimeOfDay SelectedTime;

  @override
  void initState() {
    super.initState();

    final task = widget.existingTask;

    if (task != null) {
      // Pre-fill text fields
      _todoTitleControler.text = task.title!;
      _todoDetailControler.text = task.detail!;

      // Pre-fill date
      SelectedDate = task.DueDate!;
      _todoDateControler.text =
          "${task.DueDate!.day}/${task.DueDate!.month}/${task.DueDate!.year}";

      // Pre-fill time
      SelectedTime = TimeOfDay.fromDateTime(task.DueDate!);
      final hh = SelectedTime.hourOfPeriod.toString().padLeft(2, '0');
      final mm = SelectedTime.minute.toString().padLeft(2, '0');
      _todoTimeControler.text = "$hh:$mm ${SelectedTime.period.name}";
    } else {
      // Safe defaults so the Add button doesn't crash on uninitialized late vars
      SelectedDate = DateTime.now();
      SelectedTime = TimeOfDay.now();
    }
  }

  @override
  void dispose() {
    super.dispose();
    /*_todoDateControler.dispose();
    _todoDetailControler.dispose();
    _todoTitleControler.dispose();
    _todoTimeControler.dispose();*/
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.existingTask != null ? "Edit Task" : "Add New Todo"),
      content: Container(
        width: 500,
        height: 500,
        child: Column(
          spacing: 10,
          children: [
            TextField(
              textInputAction: TextInputAction.next,
              controller: _todoTitleControler,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
                labelText: "Title",
                border: OutlineInputBorder(),
              ),
            ), //title
            TextField(
              textInputAction: TextInputAction.next,
              controller: _todoDetailControler,
              maxLines: 4,
              keyboardType: .multiline,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.line_style),
                labelText: "Detail",
                border: OutlineInputBorder(),
              ),
            ), //detail
            TextField(
              controller: _todoDateControler,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Date",
                prefixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder(),
              ),
              onTap: () {
                showDatePicker(
                  context: context,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2100),
                  initialDate: DateTime.now(),
                ).then((Date) {
                  if (Date != null) {
                    this.SelectedDate = Date;
                    _todoDateControler.text =
                        "${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}";
                  }
                });
              },
            ), //date
            TextField(
              controller: _todoTimeControler,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Time",
                prefixIcon: Icon(Icons.access_time),
                border: OutlineInputBorder(),
              ),
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((time) {
                  if (time != null) {
                    this.SelectedTime = time;
                    final hh = SelectedTime.hourOfPeriod.toString().padLeft(
                      2,
                      '0',
                    );
                    final mm = SelectedTime.minute.toString().padLeft(2, '0');
                    _todoTimeControler.text =
                        "$hh:$mm ${SelectedTime.period.name}";
                  }
                });
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Discard"),
        ),
        FilledButton(
          onPressed: () {
            final task = Task(
              taskId: widget.existingTask?.taskId,
              title: _todoTitleControler.text.toString(),
              detail: _todoDetailControler.text.toString(),
              DueDate: _CombineDateAndTime(SelectedDate, SelectedTime),
            );

            print(task.taskId);

            if (widget.existingTask != null) {
              widget.taskProvider.ResheduleTask(
                task,
                widget.existingTask?.taskId,
              ); // edit path
            } else {
              widget.taskProvider.AddTask(task);
            } // new task path
            widget.taskProvider.ShowDBTask();

            //context.read<TaskProvider>().AddTask(task);
            Navigator.pop(context);
          },
          child: Text(widget.existingTask != null ? "Save" : "Add"),
        ),

        // adding a action to add this content to list
      ],
    );
  }

  /// extra methods
  DateTime _CombineDateAndTime(DateTime date, TimeOfDay time) {
    return DateTime(date.year, date.month, date.day, time.hour, time.minute, 0);
  }
}
