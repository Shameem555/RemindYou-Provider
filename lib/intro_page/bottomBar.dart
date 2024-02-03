import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reminder/controller/bottombar-provider.dart';
import 'package:reminder/service/events_db.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomProvider>(
      builder: (BuildContext ctx, bottomprovider, Widget? child) {
        return Scaffold(
          body: bottomprovider.tabs[bottomprovider.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: bottomprovider.currentIndex,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue[200],
            iconSize: 25,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Colors.green,
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
                label: 'Settings',
                backgroundColor: Colors.blue,
              ),
            ],
            onTap: (index) {
              final eventdbprovider =
                  Provider.of<EventDB>(context, listen: false);
              bottomprovider.chartupdation(index, eventdbprovider.eventList);
            },
          ),
        );
      },
    );
  }
}
