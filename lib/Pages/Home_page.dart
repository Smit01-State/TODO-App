

import 'package:flutter/material.dart';
import '../Models/task.dart';
import '../Widgets/ListBuilder.dart';
import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {

   MyHomePage({
     super.key,
     required this.tasks,
     required this.onToggle,
     required this.onAdd
  });

 List<Task> tasks;

final void Function(Task) onAdd;
final void Function(int)  onToggle;


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

      body: widget.tasks.isEmpty?
      Center(
        child: Text("Home Page , empty list ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      )
          : Listbuilder(tasks: widget.tasks,onToggle: widget.onToggle,),

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
              widget.onAdd(task);
            });

          }
        )
    );
  } // builder
}

