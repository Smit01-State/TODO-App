

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsPage extends StatefulWidget{
   SettingsPage({super.key,});

   late Color Facolor = Colors.blue;


  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
       backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        title: Text("TODO Setting"),
      ),
      body: Center(
          child: Column(
            children: [
              IconButton(
                color: widget.Facolor,
                  onPressed: (){
                    ShowcolorPaled(context);
                  },
                  icon: Icon(Icons.color_lens)),
              Text("Setting Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
            ],
          ),
      ),
    );
  }

  void ShowcolorPaled(context){

    showDialog(context: context, builder:(context) => AlertDialog(
      title: Text("Pick a color"),
      content: PikerColor(),
      actions: [
        TextButton(onPressed: (){}, child: Text("discard")), //discard
        FilledButton(onPressed: (){
          print("${widget.Facolor}");
          Navigator.pop(context);
        }, child: Text("select"))
      ],
    ),
    );
  }

  Widget? PikerColor()=> ColorPicker(
        pickerColor: widget.Facolor,
        onColorChanged: (color){ setState(() {
            this.widget.Facolor = color;
          });

        }
        );

}

