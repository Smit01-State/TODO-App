

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_list/Models/task.dart';

class Todoaddcontent extends StatefulWidget{

  final void Function(Task) onAdd; // a variable that stores functions and accept the Task type

  Todoaddcontent({super.key, required this.onAdd});

  @override
  State<Todoaddcontent> createState() => _TodoaddcontentState();
}

class _TodoaddcontentState extends State<Todoaddcontent> {

  var _todoTitleControler = TextEditingController();

  var _todoDetailControler = TextEditingController();

  var _todoDateControler = TextEditingController();

  late DateTime SelectedDate;

  @override
  void dispose() {

    _todoDateControler.dispose();
    _todoDetailControler.dispose();
    _todoTitleControler.dispose();
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
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    initialDate: DateTime.now(),
                ).then( (Date){
                  if(Date != null){
                    this.SelectedDate = Date;
                    _todoDateControler.text = "${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}";
                  }
                });

              },
            ),//date
          ],

        ),
      ),
      actions: [

        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text("Discard")),
        FilledButton(onPressed: (){
          final task = Task(
            title: _todoTitleControler.text.toString(),
            detail: _todoDateControler.text.toString(),
            DueDate: SelectedDate
          );
          widget.onAdd(task);

          Navigator.pop(context);
        }, child: Text("Add")), // adding a action to add this content to list

      ],
    );

  }
}