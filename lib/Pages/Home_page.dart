

import 'package:flutter/material.dart';

import '../Widgets/TodoForm.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO List"),
      ),
      body: Center(
        child: Text("Home Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showTodoAddDialog();

      },
        child: Icon(Icons.add),),

    );
  }

  void TodoListBuilder(){

    ListView.builder(itemBuilder: (context, index) {
      ListTile(
        title: Text("todo"),
      );
    },);
  }

  void showTodoAddDialog() {

    showDialog(

      barrierDismissible: false,
        context: context,
        builder: (context)=>AlertDialog(

              title: Text("Add New Todo"),
              content: Todoaddcontent(),
              actions: [

                TextButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Discard")),
                FilledButton(onPressed: (){}, child: Text("Add")), // adding a action to add this content to list

              ],

         ),
    );
  }
}