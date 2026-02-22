

import 'package:flutter/material.dart';
import 'package:todo_list/Pages/History_page.dart';
import 'package:todo_list/Pages/Home_page.dart';
import 'package:todo_list/Pages/Search_page.dart';
import 'package:todo_list/Pages/Settings_page.dart';

class NavigatorPage extends StatefulWidget{
  const NavigatorPage({super.key});


  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {
    int _currentIndex = 0;
 //
  final List<Widget> _Pages = [
    MyHomePage(),
    SearchPage(),
    HistoryPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _Pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (value){
          setState((){
            _currentIndex = value;
          });
        },
          destinations: [
                NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home",selectedIcon: Icon(Icons.home),),
                NavigationDestination(icon: Icon(Icons.search_rounded), label: "Search",selectedIcon: Icon(Icons.search_rounded),),
                NavigationDestination(icon: Icon(Icons.history_toggle_off), label: "History",selectedIcon: Icon(Icons.history),),
                NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Setting",selectedIcon: Icon(Icons.settings),),
           ]
      ),
    );
  }
}