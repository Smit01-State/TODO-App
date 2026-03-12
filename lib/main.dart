import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'Pages/Navigator_page.dart';
import 'ViewModel/Task_provider.dart';
import 'ViewModel/ThemeMode_provider.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=> ThememodeProvider(),
      child: MyApp()
  )
  );
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



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    late final _lightColorScheme = ColorScheme.fromSeed(
        seedColor: context.watch<ThememodeProvider>().ColorGettter(),
        brightness: Brightness.light
    );

    late final _DarkColorScheme = ColorScheme.fromSeed(
        seedColor: context.watch<ThememodeProvider>().ColorGettter(),
        brightness: Brightness.dark
    );

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',

      theme: ThemeData(colorScheme: _lightColorScheme,),
      darkTheme: ThemeData(colorScheme: _DarkColorScheme, ),
      themeMode: context.watch<ThememodeProvider>().modeGetter(),


      home: ChangeNotifierProvider(
        create: (context)=>TaskProvider(),
          child: NavigatorPage()
      ),

    );
  }
}

