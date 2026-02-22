

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todoaddcontent extends StatelessWidget{

  var _todoDateControler = TextEditingController();
  var _todoTitleControler = TextEditingController();
  var _todoDetailControler = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Container(
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
                  lastDate: DateTime.timestamp(),
                  initialDate: DateTime.now(),
              ).then((SelectedDate){
                if(SelectedDate !=null){
                  _todoDateControler.text = "${SelectedDate.day}/${SelectedDate.month}/${SelectedDate.year}";
                }


              });
            },
          ),//date
        ],

      ),
    );

  }
}