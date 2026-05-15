import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toastification/toastification.dart';
import 'package:todo_list/Widgets/AppBarChips.dart';
import 'package:todo_list/Widgets/HistoryPageListBuilder.dart';

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
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        title: Text(
          widget.Title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12, top: 8),
            child: IconButton(
              onPressed: () {
                toastification.show(
                  context: context,
                  title: Text("Tap HomePage Search Icon"),
                  type: ToastificationType.info,
                  style: ToastificationStyle.flatColored,
                  alignment: Alignment.topCenter,
                  autoCloseDuration: Duration(seconds: 3),
                );
              },
              icon: Icon(Icons.search),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Padding(
            padding: const EdgeInsets.only(left: 16, bottom: 4),
            child: Row(
              spacing: 8,
              children: [
                FilterChips(
                  PageName: "History",
                  TLabel: "Today",
                  WLabel: "This Week",
                  MLabel: "This Month",
                ),
              ],
            ),
          ),
        ),
      ),
      body: completedTask.isEmpty
          ? Center(
              child: Image.asset(
                "assets/Icon/box.png",
                height: 75,
                width: 75,
                color: ColorScheme.of(context).onSurface,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [Flexible(child: HistoryListBuilder())],
              ),
            ),
    );
  }
}
