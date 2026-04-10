

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/Models/task.dart';
import 'package:todo_list/Services/Local/DBHelper.dart';
import '../ViewModel/Task_provider.dart';

class TodoAddContent extends StatefulWidget{

 final TaskProvider taskProvider;

  TodoAddContent({super.key,required this.taskProvider});

  @override
  State<TodoAddContent> createState() => _TodoaddcontentState();
}

class _TodoaddcontentState extends State<TodoAddContent> {

  var _todoTitleControler = TextEditingController();
  var _todoDetailControler = TextEditingController();
  var _todoDateControler = TextEditingController();
  var _todoTimeControler = TextEditingController();



  late DateTime SelectedDate;
  late TimeOfDay SelectedTime;

  @override
  void dispose() {
    super.dispose();
    _todoDateControler.dispose();
    _todoDetailControler.dispose();
    _todoTitleControler.dispose();
    _todoTimeControler.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: Text("Add New Todo"),
      content: Container(
        width: 500,
        height: 500,
        child: Column(
          spacing: 10,
          children: [
            TextField(
              controller: _todoTitleControler,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.title),
              labelText: "Title",
              border: OutlineInputBorder()
            ),),//title
            TextField(
              controller: _todoDetailControler,
              maxLines: 4,
              keyboardType: .multiline,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.line_style),
                labelText: "Detail",
                border: OutlineInputBorder()
            ),),//detail
            TextField(
              controller: _todoDateControler,
              readOnly: true,
              decoration: InputDecoration(
                labelText: "Date",
                prefixIcon: Icon(Icons.date_range),
                border: OutlineInputBorder()
            ),
              onTap: (){
                showDatePicker(
                  context: context,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                ).then( (Date){
                  if(Date != null){
                    this.SelectedDate = Date;
                    _todoDateControler.text = "${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}";
                  }
                });

              },
            ), //date
            TextField(
              controller: _todoTimeControler,
              readOnly: true,
              decoration: InputDecoration(
                  labelText: "Time",
                  prefixIcon: Icon(Icons.access_time),
                  border: OutlineInputBorder()
              ),
              onTap: (){
                showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                ).then((time){
                  if(time != null){
                    this.SelectedTime = time;
                    final hh = SelectedTime.hourOfPeriod.toString().padLeft(2,'0');
                    final mm = SelectedTime.minute.toString().padLeft(2,'0');
                    _todoTimeControler.text = "$hh:$mm ${SelectedTime.period.name}";
                  }
                });
              },

            ),
          ],

        ),
      ),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Discard")),
         FilledButton(
             onPressed: ()  {

               final task = Task(
                  title: _todoTitleControler.text.toString(),
                  detail: _todoDetailControler.text.toString(),
                  DueDate: SelectedDate,
                  DueTime: SelectedTime,
                );
               print(SelectedTime.toString());
                widget.taskProvider.AddTask(task);
               //context.read<TaskProvider>().AddTask(task);
                Navigator.pop(context);
             },
             child: Text("Add")),

         // adding a action to add this content to list

      ],
    );

  }
}