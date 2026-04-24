import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';

import '../ViewModel/ThemeMode_provider.dart';
import '../Widgets/Ui_ColorPicker.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({super.key, required this.Title});

  final String Title;

  //late Color Facolor = Colors.blue;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _appVersion = "Loading...";

  @override
  void initState() {
    super.initState();
    _loadAppVersion();
  }

  Future<void> _loadAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      _appVersion = packageInfo.version;
    });
  }

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
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                child: Text("Customization"),
              ),
              Consumer(
                builder: (context, value, child) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.onSurface,
                        width: 0.4,
                      ),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            context.watch<ThememodeProvider>().getMode ==
                                    ThemeMode.light
                                ? Icons.dark_mode
                                : Icons.light_mode,
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                          title: Text("Theme mode"),
                          //trailing: ,
                          onTap: () {
                            context
                                .read<ThememodeProvider>()
                                .ThemeModeToggale();
                            // Provider.of<ThememodeProvider>(context,listen: false).ThemeModeToggale();
                          },
                        ),
                        UiColorpicker(), // listTile for Color Pallet
                      ],
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 16, 0, 8),
                child: Text("About"),
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.onSurface,
                    width: 0.4,
                  ),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.upcoming_outlined),
                      title: Text("Coming Soon Features"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("future Features"),
                            content: SizedBox(
                              height: 100,
                              child: SingleChildScrollView(
                                scrollDirection: .vertical,
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text("1.google sync"),
                                    Text("2.Ui Improvement"),
                                    Text("3.Task handle with null value"),
                                    Text("4.Calendar"),
                                    Text("5.Search Bar"),
                                    Text(
                                      "6.filter (today , this week ,this month ) ",
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.feedback_outlined),
                      title: Text("Feedback"),
                    ),
                    ListTile(
                      leading: Icon(Icons.whatshot_outlined),
                      title: Text("What's new?"),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text("New"),
                            content: SizedBox(
                              height: 100,
                              child: SingleChildScrollView(
                                scrollDirection: .vertical,
                                child: Column(
                                  crossAxisAlignment: .start,
                                  children: [
                                    Text("1.notification & reminder "),
                                    Text("2.Rescheduling "),
                                    Text("3.Setting page improve "),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.info_outline),
                      title: Text("Version: $_appVersion"),
                    ),
                  ],
                ),
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
