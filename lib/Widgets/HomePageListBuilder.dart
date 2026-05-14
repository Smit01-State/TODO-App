import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../ViewModel/Task_provider.dart';
import 'TodoForm.dart';

class Listbuilder extends StatefulWidget {
  Listbuilder({super.key});

  @override
  State<Listbuilder> createState() => _ListbuilderState();
}

class _ListbuilderState extends State<Listbuilder> {
  ScrollController _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _controller,
      itemCount: context.watch<TaskProvider>().Tasks.length,
      itemBuilder: (context, index) {
        final task = context.watch<TaskProvider>().Tasks[index];
        return Padding(
          padding: const EdgeInsetsGeometry.all(4.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline,
                width: 0.4,
              ),
            ),
            child: ListTile(
              leading: Checkbox.adaptive(
                value: task.isCompleted,
                onChanged: (value) {
                  context.read<TaskProvider>().toggleTask(index);
                  if (task.isCompleted) {
                    context.read<TaskProvider>().ShowDBTask();
                    context.read<TaskProvider>().ShowDBHistoryTask();
                  }
                },
              ),
              title: Text(
                task.title!,
                style: TextStyle(
                  color: task.isCompleted
                      ? Colors.grey
                      : Theme.of(context).colorScheme.onSurface,
                  decoration: task.isCompleted
                      ? TextDecoration.lineThrough
                      : null,
                ),
              ),
              subtitle: Text(
                "${task.detail}",
                style: TextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Text(
                "${DateFormat("MMMM d yyyy").format(task.DueDate!)}",
              ),
              isThreeLine: false,
              onTap: () {
                showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (_) => TodoAdd(
                    existingTask: task,
                    taskProvider: context.read<TaskProvider>(),
                  ),
                );
              },
            ),
          ),
        );
        // adjust
      },
    );
  }
}
