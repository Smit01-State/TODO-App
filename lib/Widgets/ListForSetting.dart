

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListTileBuilder extends StatelessWidget{


  String? Title;
  String? Description;
  late bool mode;


  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(Title!),
      subtitle: Text(Description!),
      trailing: Switch(
          value: mode,
          onChanged: (mode){

          }
      )//Description


    );
  }
}