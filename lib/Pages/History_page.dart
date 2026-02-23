

import 'package:flutter/material.dart';

import '../Models/task.dart';
import '../Widgets/ListBuilder.dart';

class HistoryPage extends StatefulWidget{
   HistoryPage({super.key,required this.tasks,required this.onToggal});


  final List<Task> tasks;

  final Function(int) onToggal;


  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {



    final completedTask = widget.tasks.where((task)=>task.isCompleted).toList();

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO history"),
      ),
      body: completedTask.isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(tasks: completedTask,onToggle: widget.onToggal,),
    );
  }
}