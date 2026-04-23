import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list/Widgets/Ui_ColorPicker.dart';

import '../ViewModel/ThemeMode_provider.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key, required this.Title});

  final String Title;

  //late Color Facolor = Colors.blue;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
        title: Text(
          widget.Title,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: .start,
            crossAxisAlignment: .start,
            children: [
              Text("Customization"),
              Consumer(
                builder: (context, value, child) {
                  return Padding(
                    padding: EdgeInsetsGeometry.all(5.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text("Theme mode"),
                          trailing: IconButton(
                            color: Theme.of(context).colorScheme.surfaceTint,
                            onPressed: () {
                              context
                                  .read<ThememodeProvider>()
                                  .ThemeModeToggale();
                              // Provider.of<ThememodeProvider>(context,listen: false).ThemeModeToggale();
                            },
                            icon: Icon(
                              context.watch<ThememodeProvider>().getMode ==
                                      ThemeMode.light
                                  ? Icons.dark_mode
                                  : Icons.light_mode,
                            ),
                          ),
                        ),
                        ListTile(
                          title: Text("Color Theme"),
                          trailing: UiColorpicker(),
                        ),
                      ],
                    ),
                  );

                  /*IconButton(
                        onPressed: (){
                          context.read<ThememodeProvider>().ThemeModeToggale();
                       // Provider.of<ThememodeProvider>(context,listen: false).ThemeModeToggale();
                        }, icon: Icon(context.watch<ThememodeProvider>().getMode ==ThemeMode.light?Icons.dark_mode:Icons.light_mode)
                    );*/
                },
              ),
              Divider(),
              Text("About"),
              Column(
                children: [
                  ListTile(
                    title: Text("Coming Soon Features"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: Text("New feature"),
                          content: SizedBox(
                            height: 100,
                            child: SingleChildScrollView(
                              scrollDirection: .vertical,
                              child: Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text("1.notification & reminder ✅"),
                                  Text("2.google sync"),
                                  Text("3.Ui Improvement"),
                                  Text("4.Rescheduling Task"),
                                  Text("5.Task handle with null value"),
                                  Text("6.Calendar"),
                                  Text("7.Search Bar"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(title: Text("feedback")),
                  ListTile(title: Text("Version: 2.0.0")),
                ],
              ),
              // UiColorpicker(),
              SizedBox(height: 10),
              //Text("Setting Page",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
            ],
          ),
        ),
      ),
    );
  }
}
