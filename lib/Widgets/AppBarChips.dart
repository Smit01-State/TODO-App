import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/ViewModel/Task_provider.dart';

class FilterChips extends StatefulWidget {
  String? PageName;
  String? TLabel;
  String? WLabel;
  String? MLabel;

  FilterChips({this.TLabel, this.MLabel, this.WLabel, required this.PageName});

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

            switch (widget.PageName) {
              case "Home":
                Tselected
                    ? context.read<TaskProvider>().FilterTask("Today")
                    : context.read<TaskProvider>().ShowDBTask();
                break;
              case "History":
                Tselected
                    ? context.read<TaskProvider>().HistoryFilterTask("Today")
                    : context.read<TaskProvider>().ShowDBHistoryTask();
                break;
            }
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
            switch (widget.PageName) {
              case "Home":
                Wselected
                    ? context.read<TaskProvider>().FilterTask("This Week")
                    : context.read<TaskProvider>().ShowDBTask();
                break;
              case "History":
                Wselected
                    ? context.read<TaskProvider>().HistoryFilterTask(
                        "This Week",
                      )
                    : context.read<TaskProvider>().ShowDBHistoryTask();
                break;
            }
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
            switch (widget.PageName) {
              case "Home":
                Mselected
                    ? context.read<TaskProvider>().FilterTask("This Month")
                    : context.read<TaskProvider>().ShowDBTask();
                break;
              case "History":
                Mselected
                    ? context.read<TaskProvider>().HistoryFilterTask(
                        "This Month",
                      )
                    : context.read<TaskProvider>().ShowDBHistoryTask();
                break;
            }
          },
        ),
      ],
    );
  }
}
