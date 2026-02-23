

import 'package:flutter/material.dart';
import '../Models/task.dart';
import '../Widgets/ListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});





  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   List<Task> tasks  = [ ];




  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO List"),
      ),

      body: tasks.isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(tasks: tasks,),

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
        builder: (context) => Todoaddcontent(
          onAdd: (task){
            setState(() {
              tasks.add(task);
            });
          },
        )
    );
  } // builder
}

