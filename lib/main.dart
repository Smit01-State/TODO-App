import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:todo_list/Services/Local/Noti_Services.dart';

import 'Models/const/Constants.dart';
import 'Pages/Navigator_page.dart';
import 'ViewModel/Task_provider.dart';
import 'ViewModel/ThemeMode_provider.dart';

void main() async {
  /// loading files before runApp
  WidgetsFlutterBinding.ensureInitialized();

  ///Notification Initialize

  tz.initializeTimeZones();
  final Noti = await NotiServices.Noti_Instance;
  Noti.initNotification();

  /// SharedPreference
  final shrf = await SharedPreferences.getInstance();
  final isdark = shrf.getBool(Constsp.THEMEMODE_KEY) ?? false;
  final NewColor = Color(
    shrf.getInt(Constsp.THEMECOLOR_KEY) ?? Colors.blue.value,
  );

  /// DB
  //DBHelper DBinst =DBHelper.DBInstance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ThememodeProvider(isdark, NewColor),
        ),
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _doneSub;

  @override
  void initState() {
    super.initState();
    NotiServices.Noti_Instance.requestPermission();
    context.read<TaskProvider>().ShowDBTask();
    context.read<TaskProvider>().ShowDBHistoryTask();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _doneSub?.cancel();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    late final _lightColorScheme = ColorScheme.fromSeed(
      seedColor: context.watch<ThememodeProvider>().ThemeColor,
      brightness: Brightness.light,
    );

    late final _DarkColorScheme = ColorScheme.fromSeed(
      seedColor: context.watch<ThememodeProvider>().ThemeColor,
      brightness: Brightness.dark,
      contrastLevel: 0.2,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(colorScheme: _lightColorScheme),
      darkTheme: ThemeData(colorScheme: _DarkColorScheme),
      themeMode: context.watch<ThememodeProvider>().getMode,

      home: NavigatorPage(),
    );
  }
}
