

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO history"),
      ),
      body: Center(
          child: Text("History Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
    );
  }
}