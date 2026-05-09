import 'package:flutter/material.dart';

class Appbarchips extends StatefulWidget {
  String? Label;
  bool? selected;

  Appbarchips({this.Label, this.selected = false});

  @override
  State<Appbarchips> createState() => _AppbarchipsState();
}

class _AppbarchipsState extends State<Appbarchips> {
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(widget.Label!),
      selected: widget.selected!,
      onSelected: (_) {
        widget.selected == false
            ? widget.selected = true
            : widget.selected = false;
        setState(() {});
      },
    );
  }
}
