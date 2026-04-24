import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/Task_provider.dart';
import '../Widgets/ListBuilder.dart';
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
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        title: Text(
          widget.Title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),

      body: context.watch<TaskProvider>().Tasks.isEmpty
          ? Center(
              child: Text(
                "Home Page , empty list ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Listbuilder(),
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
