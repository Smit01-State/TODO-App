import 'package:flutter/material.dart';
import 'package:todo_list/Pages/Navigator_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  late final _lightColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.green,
    brightness: Brightness.light
  );
  final _DarkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.green,
      brightness: Brightness.dark
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(colorScheme: _lightColorScheme),
      darkTheme: ThemeData(colorScheme: _DarkColorScheme),

      home:  NavigatorPage(),

    );
  }
}

