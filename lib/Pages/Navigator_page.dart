

import 'package:flutter/material.dart';
import 'package:todo_list/Pages/History_page.dart';
import 'package:todo_list/Pages/Home_page.dart';
import 'package:todo_list/Pages/Search_page.dart';
import 'package:todo_list/Pages/Settings_page.dart';
import 'package:todo_list/Services/Local/DBHelper.dart';

import '../Models/task.dart';

class NavigatorPage extends StatefulWidget{

   NavigatorPage({super.key});


  @override
  State<NavigatorPage> createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage> {

     PageController _pageController = PageController();
     int _currentIndex = 0;
     String? PageTitle;

     void onTapPage(int index){
       _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.ease);
     }



 //
  late final List<Widget> _Pages = [
    MyHomePage(Title: "Todo",),
    SearchPage(Title: "Search",),
    HistoryPage(Title: "History",),
    SettingsPage(Title: "Settings",),
  ];

     @override
  void initState() {
    super.initState();
     var DBInsiator  = DBHelper.DBInstance;
     DBInsiator.getDB();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(


      body: PageView(
        controller: _pageController,
        children: _Pages,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },

      ),

      /*IndexedStack(
            index: _currentIndex,
            children: _Pages,
      ),*/

      bottomNavigationBar: Card(
        child: NavigationBar(

          selectedIndex: _currentIndex,
          onDestinationSelected: onTapPage,

            destinations: [
                  NavigationDestination(icon: Icon(Icons.home_outlined), label: "Home",selectedIcon: Icon(Icons.home),),
                  NavigationDestination(icon: Icon(Icons.search_rounded), label: "Search",selectedIcon: Icon(Icons.search_rounded),),
                  NavigationDestination(icon: Icon(Icons.history_toggle_off), label: "History",selectedIcon: Icon(Icons.history),),
                  NavigationDestination(icon: Icon(Icons.settings_outlined), label: "Setting",selectedIcon: Icon(Icons.settings),),
             ]
        ),
      ),
    );
  }
}