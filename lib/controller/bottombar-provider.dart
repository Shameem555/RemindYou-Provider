import 'package:flutter/material.dart';
import 'package:reminder/model/data_model.dart';
import 'package:reminder/screen/chart.dart';
import 'package:reminder/screen/eventscreen.dart';
import 'package:reminder/screen/homeScreen.dart';
import 'package:reminder/settings/settings.dart';
import 'package:reminder/widgets/utility.dart';

class BottomProvider extends ChangeNotifier{
  final List tabs = [
    const HomeScreen(),
    const EventScreen(),
    const Chart(),
    const Settings(),
  ];

  List<EventModel> eventModel = [];
  int _currentIndex = 0;

  int get currentIndex => _currentIndex ;

  set currentIndex(int index){
    _currentIndex = index;
    notifyListeners();
  }

   void updateChart(int index, List<EventModel> eventModel) {
    currentIndex = index;
    if (currentIndex == 2) {
      allList(alldatalist: eventModel);
      todayscreenchart tdy = todayscreenchart();
      tdy.todayList(alldatalist: eventModel);
      tdy.checkconditions();
      yesterday_screenchart ydy = yesterday_screenchart();
      ydy.yesterdayList(alldatalist: eventModel);
      ydy.checkconditions();
    }
    notifyListeners();
  }

}