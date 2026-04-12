


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../ViewModel/Task_provider.dart';


class Listbuilder extends StatefulWidget{
  Listbuilder({super.key});
  @override
  State<Listbuilder> createState() => _ListbuilderState();
}

class _ListbuilderState extends State<Listbuilder> {

  ScrollController _controller = ScrollController();
  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      controller: _controller,
      itemCount: context.watch<TaskProvider>().Tasks.length,
      itemBuilder: (context, index ) {

         final task = context.watch<TaskProvider>().Tasks[index];
          return Padding(
            padding: const EdgeInsetsGeometry.all(5.0),
            child: Card(
              elevation: 2,
              child: ListTile(
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
                        decoration: task.isCompleted? TextDecoration.lineThrough : null,
                      ),
                ),
                subtitle: Text("${task.detail}",maxLines: 1,overflow: TextOverflow.ellipsis),
                trailing: Text("${DateFormat("MMMM d yyyy").format(task.DueDate!)}"),
                isThreeLine: false,
              ),
            ),
          );
// adjust
        },

    );
  }
}
