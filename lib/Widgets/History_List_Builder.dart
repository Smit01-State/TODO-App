

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../ViewModel/Task_provider.dart';

class HistoryListBuilder extends StatefulWidget{
  const HistoryListBuilder({super.key});
  @override
  State<HistoryListBuilder> createState() => _HistoryListBuilder();
}
  class _HistoryListBuilder extends State<HistoryListBuilder>{
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: context.watch<TaskProvider>().HistoryTasks.length,

      itemBuilder: (context, index ) {
        final task = context.watch<TaskProvider>().HistoryTasks[index];

        return ListTile(
          leading: Checkbox.adaptive(
              value:task.isCompleted,
              onChanged: (value) {
                context.read<TaskProvider>().toggleTask(index);
              }),
          title: Text(task.title!,style: TextStyle(
            color: task.isCompleted ? Colors.grey
                : Theme.of(context).colorScheme.onSurface,
            decoration: task.isCompleted?TextDecoration.lineThrough:null,
          ),
          ),
          subtitle: Text("${(task.DueDate)!.day}/${(task.DueDate)!.month}/${(task.DueDate)!.year}"),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete_forever)),
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