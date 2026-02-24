


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Models/task.dart';

class Listbuilder extends StatefulWidget{


  final List<Task> tasks;
  final Function(int) onToggle;


  Listbuilder({

      super.key,
      required this.tasks,
     required this.onToggle,

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
                  widget.onToggle(index);
                });

                }),
            title: Text(task.title!,style: TextStyle(
                color: task.isCompleted ? Colors.grey
                    : Theme.of(context).colorScheme.onSurface,
              decoration: task.isCompleted?TextDecoration.lineThrough:null,
            ),
            ),
            subtitle: Text("${(task.DueDate)!.day}/${(task.DueDate)!.month}/${(task.DueDate)!.year}"),
            trailing: IconButton(onPressed: (){
                 setState(() {
                   widget.tasks.removeAt(index);
                 });
            }, icon: Icon(Icons.delete))

          );

// adjust
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(
            thickness: 1,
            height: 1,
          );
        },

    );
  }
}
