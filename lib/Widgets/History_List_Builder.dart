

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
        final Htask = context.watch<TaskProvider>().HistoryTasks[index];

        return ListTile(
          leading: IconButton(
              onPressed: () {
                context.read<TaskProvider>().HistorytoggleTask(index);
                if(!Htask.isCompleted){
                  context.read<TaskProvider>().AddTask(Htask);
                  context.read<TaskProvider>().RemoveHistoryTask(index);
                }
              },icon: Icon(Icons.settings_backup_restore),),
          title: Text(Htask.title!,style: TextStyle(
            color: Htask.isCompleted ? Colors.grey
                : Theme.of(context).colorScheme.onSurface,
            decoration: Htask.isCompleted?TextDecoration.lineThrough:null,
          ),
          ),
          subtitle: Text("${(Htask.DueDate)!.day}/${(Htask.DueDate)!.month}/${(Htask.DueDate)!.year}"),
          trailing: IconButton(onPressed: (){

            context.read<TaskProvider>().RemoveHistoryTask(index);

          }, icon: Icon(Icons.delete_forever)),
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