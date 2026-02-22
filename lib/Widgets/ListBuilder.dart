


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Models/task.dart';

class Listbuilder extends StatefulWidget{

  final List<Task> tasks;


  Listbuilder({

      super.key,
      required this.tasks,


  });

  @override
  State<Listbuilder> createState() => _ListbuilderState();
}

class _ListbuilderState extends State<Listbuilder> {
  @override
  Widget build(BuildContext context) {

    return ListView.separated(

      itemCount: widget.tasks.length,


        itemBuilder: (context, index ) {

         final task = widget.tasks[index];

          return ListTile(
            leading: Checkbox.adaptive(
                value:task.isCompleted,
                onChanged: (value) {
                  setState(() {
                    if(task.isCompleted == false){
                      task.isCompleted = true;
                    }
                    else{
                      task.isCompleted = false;
                    }
                  });

                }),
            title: Text(task.title!),
            subtitle: Text("${(task.DueDate)!.day}/${(task.DueDate)!.month}/${(task.DueDate)!.year}"),

          );


        }, separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 1,
                height: 1,
              );

          },

    );
  }
}