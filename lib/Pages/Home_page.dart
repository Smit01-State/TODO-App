import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/Task_provider.dart';
import '../Widgets/ListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.Title});

  final Title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
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
          : Listbuilder(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final taskProvider = Provider.of<TaskProvider>(
            context,
            listen: false,
          );
          showTodoAddDialog(taskProvider);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  //final taskProvider = Provider.of<TaskProvider>(context,listen: false);
  void showTodoAddDialog(taskP) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) => TodoAddContent(
        taskProvider: taskP,
      ), // this is class({required this. ..}) Constructor method
      /*(DialogContext){
        return ChangeNotifierProvider.value( // .value() this help as to use existing provider Instance not Create new one.!
            value: Provider.of<TaskProvider>(context),
          child: TodoAddContent(),
         );
        }*/
    );
  } // builder
}
