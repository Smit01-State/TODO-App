import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../ViewModel/ThemeMode_provider.dart';

class UiColorpicker extends StatefulWidget {
  UiColorpicker({super.key});

  @override
  State<UiColorpicker> createState() {
    return _UiColorpicker();
  }
}

class _UiColorpicker extends State<UiColorpicker> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Theme.of(context).colorScheme.surfaceTint,
      onPressed: () {
        ShowcolorPaled(context);
      },
      icon: Icon(Icons.format_paint_outlined),
    );
  }

  void ShowcolorPaled(context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Pick a color"),
        content: PikerColor(),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("discard"),
          ), //discard
          FilledButton(
            onPressed: () {
              print(
                "${Provider.of<ThememodeProvider>(context, listen: false).ThemeColor}",
              );
              Navigator.pop(context);
            },
            child: Text("select"),
          ),
        ],
      ),
    );
  }

  Widget? PikerColor() => ColorPicker(
    pickerColor: context.read<ThememodeProvider>().ThemeColor,
    onColorChanged: (color) {
      context.read<ThememodeProvider>().ColorChange(color);
      /*setState(() {
            this.widget.Facolor = color;
          });*/
    },
  );
}
