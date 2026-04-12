

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/ViewModel/ThemeMode_provider.dart';

import '../ViewModel/Task_provider.dart';

class HistoryListBuilder extends StatefulWidget{
  const HistoryListBuilder({super.key});
  @override
  State<HistoryListBuilder> createState() => _HistoryListBuilder();
}
  class _HistoryListBuilder extends State<HistoryListBuilder>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(

      itemCount: context.watch<TaskProvider>().HistoryTasks.length,

      itemBuilder: (context, index ) {
        final Htask = context.watch<TaskProvider>().HistoryTasks[index];

        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            elevation: 2,
            child: ListTile(
              leading: IconButton(
                  onPressed: () {
                    context.read<TaskProvider>().HistorytoggleTask(index);
                    if(!Htask.isCompleted){
                      context.read<TaskProvider>().ShowDBTask(); // show in home page because it notify the taskList and update if any changes
                      context.read<TaskProvider>().RemoveHistoryTask(index); // it just remove from HistoryList
                    }
                  },icon: Icon(Icons.settings_backup_restore),),
              title: Text(Htask.title!,style: TextStyle(
                color: Htask.isCompleted ? Colors.grey
                    : Theme.of(context).colorScheme.onSurface,
                decoration: Htask.isCompleted?TextDecoration.lineThrough:null,
              ),
              ),
              subtitle: Text("${DateFormat("MMMM d yyyy").format(Htask.DueDate!)}"),
              trailing: IconButton(onPressed: (){

                context.read<TaskProvider>().RemoveDBTask(index);

              }, icon: Icon(Icons.delete_forever)),
            ),
          ),
        );
// adjust
      },
    );
  }
}