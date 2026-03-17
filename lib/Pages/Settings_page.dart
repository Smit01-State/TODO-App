

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../ViewModel/ThemeMode_provider.dart';


class SettingsPage extends StatefulWidget{
   SettingsPage({super.key});

   //late Color Facolor = Colors.blue;


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
              Consumer(
                builder: (context, value, child) {

                  return IconButton(
                      onPressed: (){
                        context.read<ThememodeProvider>().ThemeModeToggale();
                     // Provider.of<ThememodeProvider>(context,listen: false).ThemeModeToggale();
                      }, icon: Icon(context.watch<ThememodeProvider>().getMode ==ThemeMode.light?Icons.dark_mode:Icons.light_mode)
                  );

                },

              ),
              IconButton(
                color: context.watch<ThememodeProvider>().ColorGettter(),
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
          print("${Provider.of<ThememodeProvider>(context,listen: false).ColorGettter()}");
          Navigator.pop(context);
        }, child: Text("select"))
      ],
    ),
    );
  }

  Widget? PikerColor()=> ColorPicker(
        pickerColor: context.read<ThememodeProvider>().ColorGettter(),
        onColorChanged: (color){
          context.read<ThememodeProvider>().ColorChange(color);
          /*setState(() {
            this.widget.Facolor = color;
          });*/
        }

        );

}

