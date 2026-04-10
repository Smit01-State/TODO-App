

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/task.dart';
import '../ViewModel/Task_provider.dart';
import '../Widgets/ListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {

   const MyHomePage({super.key,required this.Title});

   final Title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Center(child: Text(widget.Title)),
      ),

      body: context.watch<TaskProvider>().Tasks.isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          final taskProvider = Provider.of<TaskProvider>(context,listen: false);
          showTodoAddDialog(taskProvider);
      },
        child: Icon(Icons.add),),
    );
  }
//final taskProvider = Provider.of<TaskProvider>(context,listen: false);
  void showTodoAddDialog(taskP) {
    showDialog(
      barrierDismissible: false,
        context: context,
        builder: (_) => TodoAddContent(taskProvider: taskP) // this is class({required this. ..}) Constructor method
      /*(DialogContext){
        return ChangeNotifierProvider.value( // .value() this help as to use existing provider Instance not Create new one.!
            value: Provider.of<TaskProvider>(context),
          child: TodoAddContent(),
         );
        }*/
    );
  } // builder
}

