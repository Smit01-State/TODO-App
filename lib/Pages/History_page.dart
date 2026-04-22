import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Widgets/History_List_Builder.dart';

import '../ViewModel/Task_provider.dart';

class HistoryPage extends StatefulWidget {
  HistoryPage({super.key, required this.Title});

  final String Title;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    final completedTask = context.watch<TaskProvider>().HistoryTasks;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        title: Text(
          widget.Title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: completedTask.isEmpty
          ? Center(
              child: Text(
                "History Page , empty list ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : HistoryListBuilder(),
    );
  }
}
