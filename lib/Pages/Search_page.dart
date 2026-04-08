

import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget{
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(" TODO Search "),
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text("Search Page   ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
              SizedBox(height: 10,),
              Text("Coming Soon...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
            ],
          ),
      ),
    );
  }
}