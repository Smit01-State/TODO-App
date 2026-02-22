

import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO Setting"),
      ),
      body: Center(
          child: Text("Setting Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
    );
  }
}