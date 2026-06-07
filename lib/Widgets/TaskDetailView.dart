import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/task.dart';

/// A read-only dialog that displays completed task details.
/// Used in the History page — no editing allowed.
class TaskDetailView extends StatelessWidget {
  final Task task;

  const TaskDetailView({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final formattedDate = DateFormat("MMMM d, yyyy").format(task.DueDate!);
    final time = TimeOfDay.fromDateTime(task.DueDate!);
    final hh = time.hourOfPeriod.toString().padLeft(2, '0');
    final mm = time.minute.toString().padLeft(2, '0');
    final formattedTime = "$hh:$mm ${time.period.name.toUpperCase()}";

    return AlertDialog(
      title: Row(
        children: [
          Icon(Icons.task_alt, color: colorScheme.primary),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              "Task Details",
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
      content: Container(
        width: 500,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              // Title
              _DetailField(
                icon: Icons.title,
                label: "Title",
                value: task.title ?? "",
              ),

              // Detail
              _DetailField(
                icon: Icons.line_style,
                label: "Detail",
                value: task.detail?.isNotEmpty == true
                    ? task.detail!
                    : "No description",
                isMultiline: true,
              ),

              // Date
              _DetailField(
                icon: Icons.date_range,
                label: "Date",
                value: formattedDate,
              ),

              // Time
              _DetailField(
                icon: Icons.access_time,
                label: "Time",
                value: formattedTime,
              ),

              // Status chip
              Row(
                children: [
                  Icon(Icons.info_outline, size: 20, color: colorScheme.outline),
                  SizedBox(width: 8),
                  Chip(
                    avatar: Icon(
                      task.isCompleted
                          ? Icons.check_circle
                          : Icons.pending_outlined,
                      size: 18,
                      color: task.isCompleted ? Colors.green : Colors.orange,
                    ),
                    label: Text(
                      task.isCompleted ? "Completed" : "Pending",
                    ),
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    side: BorderSide.none,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Close"),
        ),
      ],
    );
  }
}

/// A read-only field row used inside [TaskDetailView].
class _DetailField extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool isMultiline;

  const _DetailField({
    required this.icon,
    required this.label,
    required this.value,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return InputDecorator(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(),
        enabled: false,
      ),
      child: Text(
        value,
        maxLines: isMultiline ? 4 : 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 16,
        ),
      ),
    );
  }
}
