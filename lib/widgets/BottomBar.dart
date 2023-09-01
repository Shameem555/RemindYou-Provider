import 'package:flutter/material.dart';
import 'package:reminder/screen/Chart.dart';
import 'package:reminder/screen/HomeScreen.dart';
import 'package:reminder/screen/ListScreen.dart';
import 'package:reminder/screen/Settings.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {

  int _currentIndex = 0; 
  final tabs =[
     const HomeScreen(),
     const ListScreen(),
     const Chart(),
     const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue[400],
        iconSize: 25,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_sharp),
            label: 'Note',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_rounded),
            label: 'Chart',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_applications),
            label: 'Chart',
            backgroundColor: Colors.blue,
          ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      ),
    );
  }
}