import 'package:flutter/material.dart';

class FilterChips extends StatefulWidget {
  String? TLabel;
  String? WLabel;
  String? MLabel;
  bool? selected;

  FilterChips({this.TLabel, this.MLabel, this.WLabel, this.selected = false});

  @override
  State<FilterChips> createState() => _FilterChipsState();
}

class _FilterChipsState extends State<FilterChips> {
  bool Tselected = false;
  bool Wselected = false;
  bool Mselected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        ChoiceChip(
          label: Text(widget.TLabel!),
          selected: Tselected,
          onSelected: (_) {
            setState(() {
              Tselected == false ? Tselected = true : Tselected = false;
              if (Tselected) {
                Wselected = false;
                Mselected = false;
              }
            });
          },
        ),
        ChoiceChip(
          label: Text(widget.WLabel!),
          selected: Wselected,
          onSelected: (_) {
            setState(() {
              Wselected == false ? Wselected = true : Wselected = false;
              if (Wselected) {
                Tselected = false;
                Mselected = false;
              }
            });
          },
        ),
        ChoiceChip(
          label: Text(widget.MLabel!),
          selected: Mselected,
          onSelected: (_) {
            setState(() {
              Mselected == false ? Mselected = true : Mselected = false;
              if (Mselected) {
                Wselected = false;
                Tselected = false;
              }
            });
          },
        ),
      ],
    );
  }
}
