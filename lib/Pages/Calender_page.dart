import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:todo_list/Models/task.dart';
import 'package:todo_list/ViewModel/Task_provider.dart';
import 'package:todo_list/Widgets/TodoForm.dart';
import 'package:todo_list/Widgets/TaskDetailView.dart';

class CalenderPage extends StatefulWidget {
  CalenderPage({super.key, required this.Title});

  final String Title;

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    final taskProvider = context.watch<TaskProvider>();
    final allTasks = [...taskProvider.Tasks, ...taskProvider.HistoryTasks];

    // Filter tasks for the selected day
    final selectedDayTasks = allTasks.where((task) {
      return task.DueDate != null && isSameDay(task.DueDate, _selectedDay);
    }).toList();

    // Sort tasks by due date/time
    selectedDayTasks.sort((a, b) => a.DueDate!.compareTo(b.DueDate!));

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          widget.Title,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Card(
              color: Theme.of(context).colorScheme.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                  width: 0.4,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: TableCalendar(
                  focusedDay: _focusedDay,
                  firstDay: DateTime(2000),
                  lastDay: DateTime(3000),
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  eventLoader: (day) {
                    return allTasks.where((task) => task.DueDate != null && isSameDay(task.DueDate, day)).toList();
                  },
                  daysOfWeekStyle: DaysOfWeekStyle(
                    weekdayStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                      fontWeight: FontWeight.w500,
                    ),
                    weekendStyle: TextStyle(
                      color: Colors.redAccent.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  calendarStyle: CalendarStyle(
                    outsideDaysVisible: false,
                    defaultTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.w500,
                    ),
                    weekendTextStyle: TextStyle(
                      color: Colors.redAccent.withOpacity(0.8),
                      fontWeight: FontWeight.w500,
                    ),
                    selectedTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.4),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    todayTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                    todayDecoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.15),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: colorScheme.primary,
                        width: 1.5,
                      ),
                    ),
                  ),
                  headerStyle: HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                    titleTextStyle: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    leftChevronIcon: Icon(
                      Icons.chevron_left_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    rightChevronIcon: Icon(
                      Icons.chevron_right_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, day, events) {
                      if (events.isEmpty) return const SizedBox();
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: events.take(4).map((event) {
                          final task = event as Task;
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 1.0),
                            width: 5,
                            height: 5,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: task.isCompleted
                                  ? Colors.grey
                                  : Theme.of(context).colorScheme.primary,
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const Divider(),
          Expanded(
            child: selectedDayTasks.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.event_busy_rounded,
                          size: 64,
                          color: Theme.of(context).colorScheme.outline,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No tasks for this day",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: selectedDayTasks.length,
                    itemBuilder: (context, index) {
                      final task = selectedDayTasks[index];
                      if (task.isCompleted) {
                        final historyIndex = taskProvider.HistoryTasks.indexWhere((t) => t.taskId == task.taskId);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.outline,
                                width: 0.4,
                              ),
                            ),
                            child: ListTile(
                              leading: IconButton(
                                onPressed: () async {
                                  if (historyIndex != -1) {
                                    await context.read<TaskProvider>().HistorytoggleTask(historyIndex);
                                    context.read<TaskProvider>().ShowDBTask();
                                    context.read<TaskProvider>().RemoveHistoryTask(historyIndex);
                                  }
                                },
                                icon: const Icon(Icons.settings_backup_restore),
                              ),
                              title: Text(
                                task.title!,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                              subtitle: Text(
                                DateFormat("MMMM d yyyy").format(task.DueDate!),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  if (historyIndex != -1) {
                                    context.read<TaskProvider>().RemoveDBTask(historyIndex);
                                  }
                                },
                                icon: const Icon(Icons.delete_forever),
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (_) => TaskDetailView(task: task),
                                );
                              },
                            ),
                          ),
                        );
                      } else {
                        final taskIndex = taskProvider.Tasks.indexWhere((t) => t.taskId == task.taskId);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                          child: Card(
                            color: Theme.of(context).colorScheme.surface,
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
                                onChanged: (value) async {
                                  if (taskIndex != -1) {
                                    await context.read<TaskProvider>().toggleTask(taskIndex);
                                    context.read<TaskProvider>().ShowDBTask();
                                    context.read<TaskProvider>().ShowDBHistoryTask();
                                  }
                                },
                              ),
                              title: Text(
                                task.title!,
                                style: TextStyle(
                                  color: Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              subtitle: Text(
                                "${task.detail}",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              trailing: Text(
                                DateFormat("MMMM d yyyy").format(task.DueDate!),
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
                      }
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
