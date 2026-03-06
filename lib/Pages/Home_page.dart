

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Provider/Task_provider.dart';
import '../Models/task.dart';
import '../Widgets/ListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {

   MyHomePage({super.key,});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO List"),
      ),

      body: context.watch<TaskProvider>().TaskGetter().isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showTodoAddDialog();
      },
        child: Icon(Icons.add),),
    );
  }

  void showTodoAddDialog() {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (context) => Todoaddcontent()
    );
  } // builder
}

