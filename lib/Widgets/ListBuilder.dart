


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Task_provider.dart';


class Listbuilder extends StatefulWidget{
  Listbuilder({super.key});



  @override
  State<Listbuilder> createState() => _ListbuilderState();
}

class _ListbuilderState extends State<Listbuilder> {
  @override
  Widget build(BuildContext context) {

    return ListView.separated(

      itemCount: context.watch<TaskProvider>().Tasks.length,
      itemBuilder: (context, index ) {

         final task = context.watch<TaskProvider>().Tasks[index];

          return ListTile(
            leading: Checkbox.adaptive(
                value:task.isCompleted,
                onChanged: (value) {
                  context.read<TaskProvider>().toggleTask(index);
                  if(task.isCompleted){
                    context.read<TaskProvider>().AddHistoryTask(task);
                    context.read<TaskProvider>().RemoveTask(index);
                   }
                }),
            title: Text(task.title!,
                  style: TextStyle(
                        color: task.isCompleted ? Colors.grey : Theme.of(context).colorScheme.onSurface,
                    decoration: task.isCompleted?TextDecoration.lineThrough:null,
                  ),
            ),
            subtitle: Text("${(task.DueDate)!.day}/${(task.DueDate)!.month}/${(task.DueDate)!.year}"),

          );

// adjust
        },
        separatorBuilder: ( context,  index) {
          return const Divider(
            thickness: 1,
            height: 1,
          );
        },

    );
  }
}
