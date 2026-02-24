import 'package:flutter/material.dart';
import 'package:todo_list/Pages/Navigator_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  /*late Color Facolor = Colors.blue;

  void colorChange(Color color){
    setState(() {
      this.Facolor = color;
      print("Color changed to $color");
    });

  }*/

  late final _lightColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.brown,
    brightness: Brightness.light
  );

  late final _DarkColorScheme = ColorScheme.fromSeed(
      seedColor: Colors.brown,
      brightness: Brightness.dark
  );

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(colorScheme: _lightColorScheme,),
      darkTheme: ThemeData(colorScheme: _DarkColorScheme, ),


      home:  NavigatorPage(),

    );
  }
}

