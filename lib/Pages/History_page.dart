

import 'package:flutter/material.dart';

import '../Models/task.dart';
import '../Widgets/ListBuilder.dart';

class HistoryPage extends StatelessWidget{
   HistoryPage({super.key});

  List<Task> tasks = [];


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO history"),
      ),
      body: tasks.isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(tasks: tasks,  ),
    );
  }
}