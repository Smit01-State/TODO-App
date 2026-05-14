import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/Task_provider.dart';
import '../Widgets/AppBarChips.dart';
import '../Widgets/HomePageListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {
  final Title;

  const MyHomePage({super.key, required this.Title});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final TaskProviderRead = context.read<TaskProvider>();

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
            child: Icon(Icons.search),
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
                  PageName: "Home",
                  TLabel: "Today",
                  WLabel: "This Week",
                  MLabel: "This Month",
                ),
              ],
            ),
          ),
        ),
      ),

      body: context.watch<TaskProvider>().Tasks.isEmpty
          ? Center(
              child: Text(
                " No Task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: .start,
                crossAxisAlignment: .start,
                children: [Flexible(child: Listbuilder())],
              ),
            ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (_) => TodoAdd(taskProvider: TaskProviderRead),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
