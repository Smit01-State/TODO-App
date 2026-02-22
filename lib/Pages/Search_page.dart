

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text(" TODO Search "),
      ),
      body: Center(
          child: Text("Search Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
    );
  }
}